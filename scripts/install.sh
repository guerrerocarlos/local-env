#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_BIN_DIR="${TARGET_BIN_DIR:-$HOME/.local/bin}"

mkdir -p "$TARGET_BIN_DIR"

install -m 0755 "$ROOT_DIR/aliases/codex-local" "$TARGET_BIN_DIR/codex-local"
install -m 0755 "$ROOT_DIR/aliases/codex-yolo-qwen25" "$TARGET_BIN_DIR/codex-yolo-qwen25"
install -m 0755 "$ROOT_DIR/aliases/codex-upstream" "$TARGET_BIN_DIR/codex-upstream"

echo "Installed wrappers to: $TARGET_BIN_DIR"
echo "- codex-local"
echo "- codex-yolo-qwen25"
echo "- codex-upstream"

echo ""
echo "If needed, ensure this is in PATH: export PATH=\"$TARGET_BIN_DIR:\$PATH\""
echo "Pull model if missing: ollama pull qwen2.5-coder:14b"
