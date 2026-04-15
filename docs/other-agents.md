# Other Agents

This repository currently provides one native integration target:

- Codex skills

Other agents can still reuse the same guidance, but this repository does not
pretend they all share one install format.

## Claude Code

Claude Code does not use the same native skill directory layout as Codex.

Recommended approach:

1. Copy the operational guidance from:
   - `skills/echobell-notify/SKILL.md`
   - `examples/prompt-kit.md`
2. Place the relevant instructions in your project memory, custom prompt
   templates, or team runbook.
3. Export `ECHOBELL_WEBHOOK_URL` in the shell environment that launches Claude
   Code.

## Cursor and Windsurf

For Cursor and Windsurf, treat this repository as a prompt and runbook package:

1. Copy the prompt snippets from `examples/prompt-kit.md`
2. Add them to your workspace rules or reusable prompts
3. Make sure the agent runtime can reach the same `ECHOBELL_WEBHOOK_URL`

## Why the repo starts with Codex

Codex gives this repository a stable, explicit skill format, which means:

- the install path is deterministic
- the invocation format is explicit
- the repository can validate installation and structure automatically

That is a better first milestone than claiming universal agent support with weak
or hand-wavy install instructions.

