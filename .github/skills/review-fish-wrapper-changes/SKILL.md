---
name: review-fish-wrapper-changes
description: Review fish wrapper changes for token injection consistency and safe argument passthrough.
---

# Review fish wrapper changes

Use this skill for PR/code review requests touching `functions/` or `completions/`.

## Checklist
- Wrapper functions still call the underlying binary via `command <tool> $argv`.
- `ARTIFACTS_ACCESSTOKEN` is sourced from Azure CLI access token command.
- Azure Artifacts resource ID remains unchanged unless requested.
- No accidental behavior changes in `write-npm.fish` defaults or usage flow.
- `completions/pnpm.fish` keeps placeholder token fallback and completion formatting behavior.

Focus on functional risks; skip style-only comments.

