---
name: fish-validation-specialist
description: Validate fish plugin changes using syntax checks and lightweight smoke tests.
---

# fish-validation-specialist

Use this agent when users ask to verify or test changes in this repository.

## Validation workflow
1. Run syntax checks:
   - `fish --no-execute functions/*.fish completions/*.fish`
2. Run targeted single-wrapper smoke test with stubbed token:
   - `fish -c 'function az; echo fake-token; end; source functions/<tool>.fish; <tool> --version >/dev/null'`
3. When changes affect multiple wrappers, run smoke tests for each touched wrapper.
4. If `write-npm.fish` changed, validate usage output and non-zero return on missing feed argument.

## Reporting
- Return clear pass/fail results and the first actionable error.

