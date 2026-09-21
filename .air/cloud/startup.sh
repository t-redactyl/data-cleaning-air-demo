#!/usr/bin/env bash
set -euo pipefail

if [ "${AIR_STARTUP_MODE:-}" = warmup ]; then
  WARMUP=1
else
  WARMUP=
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$REPO_ROOT"

healthcheck() {
  echo "Checking the Python data-cleaning environment..."
  uv run python - <<'PY'
import sqlite3

import ipywidgets
import matplotlib
import notebook
import pandas
import seaborn

with sqlite3.connect("data/census_data.db") as connection:
    connection.execute("SELECT name FROM sqlite_master LIMIT 1").fetchone()
PY

  echo "Waiting for Jupyter Notebook on port 8888..."
  until page="$(curl --fail --silent --show-error \
    -H 'Host: localhost:8888' \
    http://127.0.0.1:8888/tree 2>/dev/null)" &&
    grep -q 'Jupyter' <<<"$page"; do
    echo "Jupyter is still starting; recent output:"
    tail -n 5 /tmp/data-cleaning-jupyter.log 2>/dev/null || true
    sleep 2
  done
  echo "Jupyter Notebook is ready."
}

echo "Installing the locked Python 3.14 environment..."
uv sync --locked
echo "Python dependencies are ready."

if ! curl --fail --silent http://127.0.0.1:8888/tree >/dev/null 2>&1; then
  echo "Starting Jupyter Notebook on port 8888..."
  nohup uv run jupyter notebook \
    --no-browser \
    --ServerApp.ip=0.0.0.0 \
    --ServerApp.port=8888 \
    --ServerApp.port_retries=0 \
    --ServerApp.root_dir="$REPO_ROOT" \
    --ServerApp.allow_remote_access=True \
    --ServerApp.allow_origin='*' \
    --IdentityProvider.token='' \
    >/tmp/data-cleaning-jupyter.log 2>&1 &
fi

if [ -n "$WARMUP" ]; then
  healthcheck
fi
