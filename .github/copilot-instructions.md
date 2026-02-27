# Copilot instructions for az-auth.fish

## Build, test, and lint
- This repository has no build system.
- Lint/syntax check fish scripts:
  - `fish --no-execute functions/*.fish completions/*.fish`
- Single-wrapper smoke test (example for `npm` wrapper):
  - `fish -c 'function az; echo fake-token; end; source functions/npm.fish; npm --version >/dev/null'`
- Full manual smoke test for wrappers:
  - `fish -c 'function az; echo fake-token; end; source functions/npm.fish; source functions/npx.fish; source functions/pnpm.fish; source functions/pnpx.fish; source functions/yarn.fish; source functions/bun.fish; npm --version >/dev/null; npx --version >/dev/null; pnpm --version >/dev/null; pnpx --version >/dev/null; yarn --version >/dev/null; bun --version >/dev/null'`

## High-level architecture
- `functions/` contains fish wrappers for package manager commands that inject `ARTIFACTS_ACCESSTOKEN` from Azure CLI before delegating to the real command.
- `functions/write-npm.fish` writes Azure Artifacts npm feed entries into `$HOME/.npmrc`.
- `completions/pnpm.fish` provides pnpm completion-server integration and forwards `ARTIFACTS_ACCESSTOKEN` to completions.
- `README.md` documents install, dependency, and feed setup.

## Code style and patterns
- Keep wrapper functions minimal and consistent:
  - `function <name>`
  - `ARTIFACTS_ACCESSTOKEN=(az account get-access-token --resource "499b84ac-1321-427f-aa17-267ca6975798" --query accessToken -o tsv) command <name> $argv`
  - `end`
- Preserve argument passthrough with `$argv`.
- Use `set -l` for local variables (as in `write-npm.fish`).
- Keep user-facing messages concise and return non-zero for invalid usage.

## Path-specific instructions
- `functions/*.fish`:
  - For command wrappers (`npm`, `npx`, `pnpm`, `pnpx`, `yarn`, `bun`), keep the function body to token injection + `command <tool> $argv`.
  - Do not change the Azure Artifacts resource ID unless explicitly requested.
- `functions/write-npm.fish`:
  - Keep defaults for username/email behavior and append-only writes to `$HOME/.npmrc`.
- `completions/*.fish`:
  - Maintain placeholder token behavior (`__fish_completion_placeholder__`) when token is missing.
  - Keep completion output handling compatible with fish completion conventions.
