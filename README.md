# local-env

Portable backup for local Codex + Ollama workflow aliases and baseline config.

## What is included

- `aliases/codex-local`: run Codex against local Ollama model (`qwen2.5-coder:14b`) without changing default `codex`.
- `aliases/codex-yolo-qwen25`: same local model, but bypass approvals/sandbox for fast local runs.
- `aliases/codex-upstream`: explicit helper to run upstream Codex.
- `aliases/codex-lmstudio`: run Codex against a model loaded in LM Studio.
- `aliases/opencode-ollama`: run OpenCode CLI against Ollama.
- `aliases/opencode-lmstudio`: run OpenCode CLI against LM Studio.
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
codex-lmstudio         # local LM Studio model
opencode-ollama        # OpenCode via Ollama
opencode-lmstudio      # OpenCode via LM Studio
```

## Optional overrides

- `CODEX_LOCAL_MODEL`: change local model (default `qwen2.5-coder:14b`)
- `REAL_CODEX_BIN`: explicit Codex binary path
- `OLLAMA_BIN`: explicit Ollama binary path
- `TARGET_BIN_DIR`: custom install destination for wrappers

## Aider + Ollama helper

- `aliases/aider-local`: launches aider against local Ollama with sane defaults.

Behavior:
- Auto-starts Ollama daemon if not running.
- Sets `OLLAMA_API_BASE` automatically (`http://127.0.0.1:11434` by default).
- Sets `AIDER_OPENAI_API_BASE` to `${OLLAMA_API_BASE}/v1`.
- Uses `ollama/qwen2.5-coder:14b` by default.
- Suppresses non-critical model metadata warnings (`--no-show-model-warnings`).

Usage:

```bash
aider-local
# or
aider-local --model ollama/qwen3-coder:30b
```

Optional overrides:
- `AIDER_OLLAMA_MODEL`: default model for aider-local
- `OLLAMA_BIN`: explicit ollama binary path
- `AIDER_BIN`: explicit aider binary path

## LM Studio helpers

- `aliases/aider-lmstudio`: run aider against LM Studio OpenAI-compatible API (`http://127.0.0.1:1234/v1`).
- `aliases/codex-lmstudio`: run Codex against LM Studio using `--local-provider lmstudio`.

Behavior:
- Auto-starts LM Studio server if not running.
- Uses first loaded LLM model from `lms ps` unless overridden.
- Prints clear instructions if no LLM model is loaded.

Usage:

```bash
aider-lmstudio
codex-lmstudio
```

Overrides:
- `AIDER_LMSTUDIO_MODEL`: explicit model identifier for `aider-lmstudio`
- `CODEX_LMSTUDIO_MODEL`: explicit model identifier for `codex-lmstudio`
- `LMS_BIN`: explicit `lms` binary path

## OpenCode helpers

- `aliases/opencode-ollama`: starts/uses Ollama and runs OpenCode with `ollama/qwen2.5-coder:14b` by default.
- `aliases/opencode-lmstudio`: starts/uses LM Studio server and runs OpenCode with `lmstudio/deepseek-coder-v2-16b` by default.

Usage:

```bash
opencode-ollama
opencode-lmstudio
```

Overrides:
- `OPENCODE_OLLAMA_MODEL`: default model for `opencode-ollama`
- `OPENCODE_LMSTUDIO_MODEL`: default model for `opencode-lmstudio`
- `OPENCODE_BIN`: explicit `opencode` binary path

Config example:
- `opencode/opencode.json.example`

## New terminal troubleshooting

If a wrapper command is not found in a fresh terminal:

1. Verify install location:
```bash
ls -l ~/.local/bin/aider-local ~/.local/bin/codex-local
```
2. Ensure your shell includes `~/.local/bin` (and optionally `~/bin`) in `PATH`.
3. For `bash`, add to `~/.bashrc`:
```bash
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
```
4. For `fish`, add to `~/.config/fish/config.fish`:
```fish
fish_add_path -m $HOME/.local/bin $HOME/bin
```
5. Open a new terminal (or source your shell config).
