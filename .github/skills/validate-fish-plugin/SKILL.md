---
name: validate-fish-plugin
description: Validate fish wrapper and completion changes with syntax and smoke checks.
---

# Validate fish plugin changes

When changes touch `functions/*.fish` or `completions/*.fish`, run:

1. Syntax check:
   - `fish --no-execute functions/*.fish completions/*.fish`
2. For each changed wrapper (`npm`, `npx`, `pnpm`, `pnpx`, `yarn`, `bun`), run:
   - `fish -c 'function az; echo fake-token; end; for f in functions/*.fish; source $f; end; <tool> --version >/dev/null'`
3. If `functions/write-npm.fish` changed, verify usage error behavior:
   - `fish -c 'source functions/write-npm.fish; write-npm; echo status:$status'`

Report failures with the exact command and first failing output.
