#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_BIN_DIR="${TARGET_BIN_DIR:-$HOME/.local/bin}"

mkdir -p "$TARGET_BIN_DIR"

install -m 0755 "$ROOT_DIR/aliases/codex-local" "$TARGET_BIN_DIR/codex-local"
install -m 0755 "$ROOT_DIR/aliases/codex-yolo-qwen25" "$TARGET_BIN_DIR/codex-yolo-qwen25"
install -m 0755 "$ROOT_DIR/aliases/codex-upstream" "$TARGET_BIN_DIR/codex-upstream"
install -m 0755 "$ROOT_DIR/aliases/codex-lmstudio" "$TARGET_BIN_DIR/codex-lmstudio"
install -m 0755 "$ROOT_DIR/aliases/aider-local" "$TARGET_BIN_DIR/aider-local"
install -m 0755 "$ROOT_DIR/aliases/aider-lmstudio" "$TARGET_BIN_DIR/aider-lmstudio"
install -m 0755 "$ROOT_DIR/aliases/opencode-ollama" "$TARGET_BIN_DIR/opencode-ollama"
install -m 0755 "$ROOT_DIR/aliases/opencode-lmstudio" "$TARGET_BIN_DIR/opencode-lmstudio"

echo "Installed wrappers to: $TARGET_BIN_DIR"
echo "- codex-local"
echo "- codex-yolo-qwen25"
echo "- codex-upstream"
echo "- codex-lmstudio"
echo "- aider-local"
echo "- aider-lmstudio"
echo "- opencode-ollama"
echo "- opencode-lmstudio"

echo ""
echo "If needed, ensure this is in PATH: export PATH=\"$TARGET_BIN_DIR:\$PATH\""
echo "Pull model if missing: ollama pull qwen2.5-coder:14b"
