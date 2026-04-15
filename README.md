# Echobell Agent

`echobell-agent` is a dedicated repository for agent-facing Echobell integrations.

Version 1 ships one thing only: a reusable Echobell notification skill for
long-running agent work, packaged in a way that can be installed through common
agent instruction surfaces first, with native Codex support as a secondary path.

## What This Repository Includes

- A portable `AGENTS.md` template for agents that support repository-level
  instructions
- A reusable `SKILL.md` skill folder for skill-aware runtimes
- Agent-specific adapters for Claude Code, Cursor, Windsurf, Copilot, and Codex
- Generic and Codex-specific installers
- Prompt and payload examples
- Detailed setup, compatibility, usage, adapter, and troubleshooting docs
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

3. Install the generic repository-level adapter:

   ```bash
   ./scripts/install-agent-adapter.sh agents-md /path/to/your/workspace
   ```

4. If your agent supports native skill directories, optionally install the skill
   folder too:

   ```bash
   ./scripts/install-skill.sh
   ```

5. If you use Codex specifically, you can also install the native Codex skill:

   ```bash
   ./scripts/install-codex-skill.sh
   ```

6. Use prompts such as:

   ```text
   Use $echobell-notify and send me a time-sensitive Echobell notification when this refactor finishes.
   ```

## Repository Layout

```text
.
├── docs/
│   ├── compatibility.md
│   ├── installation.md
│   ├── other-agents.md
│   ├── troubleshooting.md
│   └── usage.md
├── adapters/
│   ├── claude-code/
│   ├── copilot/
│   ├── cursor/
│   └── windsurf/
├── examples/
│   ├── env.example
│   └── prompt-kit.md
├── scripts/
│   ├── install-agent-adapter.sh
│   ├── install-skill.sh
│   ├── install-codex-skill.sh
│   ├── uninstall-skill.sh
│   ├── uninstall-codex-skill.sh
│   └── validate-skill.sh
├── templates/
│   ├── AGENTS.md
│   └── CLAUDE.md
└── skills/
    └── echobell-notify/
        ├── SKILL.md
        ├── agents/openai.yaml
        └── references/
            ├── payloads.md
            └── setup.md
```

## Documentation

- [Compatibility](./docs/compatibility.md)
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

The script validates the generic skill installer, the AGENTS/CLAUDE adapters,
the Codex wrapper, and the expected repository assets.

## Roadmap

- Add an MCP server as a separate module
- Add hosted webhook helper tooling if the ergonomics justify it
- Add IDE-specific adapters once the skill workflow stabilizes
