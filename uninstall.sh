#!/usr/bin/env bash
set -euo pipefail

TARGET="${HOME}/.local/bin/tagger"

if [[ -L "$TARGET" || -f "$TARGET" ]]; then
  rm -f "$TARGET"
  echo "Removed $TARGET"
else
  echo "No installed tagger found at $TARGET"
fi