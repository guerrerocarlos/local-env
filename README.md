# local-env

Portable backup for local Codex + Ollama workflow aliases and baseline config.

## What is included

- `aliases/codex-local`: run Codex against local Ollama model (`qwen2.5-coder:14b`) without changing default `codex`.
- `aliases/codex-yolo-qwen25`: same local model, but bypass approvals/sandbox for fast local runs.
- `aliases/codex-upstream`: explicit helper to run upstream Codex.
- `scripts/install.sh`: installs aliases into `~/.local/bin`.
- `codex/config.toml.example`: minimal Codex config baseline.
- `ollama/models.txt`: model names to pull.

## Behavior

- `codex-local` and `codex-yolo-qwen25` auto-start Ollama (`ollama serve`) if the daemon is not running.
- They suppress the known non-fatal warning:
  - `Model metadata for \`<model>\` not found...`
- You can re-enable that warning with:
  - `export CODEX_LOCAL_SHOW_METADATA_WARNING=1`

## Install

```bash
cd local-env
./scripts/install.sh
```

## Prerequisites

- Codex CLI available in `PATH` as `codex`
- Ollama installed and available in `PATH` as `ollama`
- Local model pulled:

```bash
ollama pull qwen2.5-coder:14b
```

## Usage

```bash
codex                 # upstream/default behavior
codex-local           # local Ollama model
codex-yolo-qwen25     # local Ollama + yolo flags
codex-upstream         # explicit upstream
```

## Optional overrides

- `CODEX_LOCAL_MODEL`: change local model (default `qwen2.5-coder:14b`)
- `REAL_CODEX_BIN`: explicit Codex binary path
- `OLLAMA_BIN`: explicit Ollama binary path
- `TARGET_BIN_DIR`: custom install destination for wrappers
