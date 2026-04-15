# Echobell Agent

`echobell-agent` is a dedicated repository for agent-facing Echobell integrations.

Version 1 ships one thing only: a reusable Codex skill for sending Echobell
notifications when long-running agent work finishes or fails, plus the docs and
scripts required to install and operate it cleanly.

## What This Repository Includes

- A native Codex skill: `skills/echobell-notify`
- A safe installer for local Codex skill directories
- Prompt and payload examples
- Detailed setup, usage, adapter, and troubleshooting docs
- A validation script and CI workflow

## Current Scope

- Included: Skill-based agent integration
- Not included yet: MCP server, hosted API helpers, IDE extensions

## Quick Start

1. Create an Echobell channel or Direct key and copy the webhook URL.
2. Export the webhook URL:

   ```bash
   export ECHOBELL_WEBHOOK_URL="https://hook.echobell.one/your-channel-or-direct-url"
   ```

3. Install the skill:

   ```bash
   ./scripts/install-codex-skill.sh
   ```

4. Restart Codex so it reloads local skills.
5. Use prompts such as:

   ```text
   Use $echobell-notify and send me a time-sensitive Echobell notification when this refactor finishes.
   ```

## Repository Layout

```text
.
├── docs/
│   ├── installation.md
│   ├── other-agents.md
│   ├── troubleshooting.md
│   └── usage.md
├── examples/
│   ├── env.example
│   └── prompt-kit.md
├── scripts/
│   ├── install-codex-skill.sh
│   ├── uninstall-codex-skill.sh
│   └── validate-skill.sh
└── skills/
    └── echobell-notify/
        ├── SKILL.md
        ├── agents/openai.yaml
        └── references/
            ├── payloads.md
            └── setup.md
```

## Documentation

- [Installation](./docs/installation.md)
- [Usage](./docs/usage.md)
- [Using the repo with other agents](./docs/other-agents.md)
- [Troubleshooting](./docs/troubleshooting.md)
- [Prompt examples](./examples/prompt-kit.md)

## Design Notes

The skill stays intentionally narrow:

- It does not invent a notification product abstraction.
- It assumes Echobell already owns delivery.
- It helps the agent decide when to notify, what urgency to use, and how to
  structure a clean payload.

That keeps the skill useful across code review, refactors, data jobs, CI
triage, and other long-running agent tasks without turning the repository into
an SDK too early.

## Validation

Run the local validation flow:

```bash
./scripts/validate-skill.sh
```

The script installs the skill into a temporary Codex home and checks that the
expected files exist.

## Roadmap

- Add an MCP server as a separate module
- Add hosted webhook helper tooling if the ergonomics justify it
- Add IDE-specific adapters once the skill workflow stabilizes

