#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
TARGET="${BIN_DIR}/tagger"

mkdir -p "$BIN_DIR"
chmod +x "${REPO_DIR}/tagger"

ln -sf "${REPO_DIR}/tagger" "$TARGET"

SHELL_RC=""
if [[ -n "${ZSH_VERSION:-}" ]]; then
  SHELL_RC="${HOME}/.zshrc"
elif [[ -n "${BASH_VERSION:-}" ]]; then
  SHELL_RC="${HOME}/.bashrc"
else
  SHELL_RC="${HOME}/.profile"
fi

if ! echo ":$PATH:" | grep -q ":${BIN_DIR}:"; then
  if ! grep -Fq 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC" 2>/dev/null; then
    echo '' >> "$SHELL_RC"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
  fi
  echo "Added ${BIN_DIR} to PATH in ${SHELL_RC}"
  echo "Restart your shell or run:"
  echo "  source ${SHELL_RC}"
fi

echo "Installed tagger to ${TARGET}"
echo "Try:"
echo "  tagger --help"