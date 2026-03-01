#!/usr/bin/env bash
set -euo pipefail

echo "📚 Starting documentation release..."
echo "🖼 Exporting drawio to PNG..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$REPO_ROOT"

if [[ ! -f "docs/system_architecture.drawio" ]]; then
  echo "❌ Drawio file not found"
  exit 1
fi

docker run --rm \
  -v "$REPO_ROOT":/data \
  rlespinasse/drawio-export \
  --format png \
  --output /data/docs \
  /data/docs/system_architecture.drawio

echo "✅ Documentation export complete."