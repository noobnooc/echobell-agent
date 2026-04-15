# Installation

This repository installs in three layers:

1. generic `AGENTS.md`
2. generic `SKILL.md` skill directory
3. agent-native adapters

Start at the top and only use a more specific layer when your agent needs it.

## Prerequisites

- An Echobell webhook destination
- Shell access on the machine where the agent runs

You can use either:

- A channel webhook URL, or
- An Echobell Direct webhook URL

The skill prefers one environment variable:

```bash
export ECHOBELL_WEBHOOK_URL="https://hook.echobell.one/..."
```

## Option 1: Generic `AGENTS.md` Install

This is the recommended default for most agent-enabled workspaces.

Clone the repository and install the repository instruction file:

```bash
git clone git@github.com:noobnooc/echobell-agent.git
cd echobell-agent
./scripts/install-agent-adapter.sh agents-md /path/to/your/workspace
```

This creates:

```text
/path/to/your/workspace/AGENTS.md
```

Use this path first for agents that read repository-level instructions.

## Option 2: Generic Skill Directory Install

If your runtime supports `SKILL.md`-based discovery, install the skill folder:

```bash
./scripts/install-skill.sh
```

By default the script copies `skills/echobell-notify` into:

```text
${AGENT_SKILLS_HOME:-$HOME/.agents/skills}/echobell-notify
```

You can also install to a project-local or vendor-specific skill root:

```bash
./scripts/install-skill.sh /path/to/project/.agents/skills
./scripts/install-skill.sh /path/to/project/.github/skills
./scripts/install-skill.sh "$HOME/.copilot/skills"
```

## Option 3: Agent-native adapters

Use these when you want the native surface for a specific agent:

```bash
./scripts/install-agent-adapter.sh claude-code /path/to/workspace
./scripts/install-agent-adapter.sh cursor /path/to/workspace
./scripts/install-agent-adapter.sh windsurf /path/to/workspace
./scripts/install-agent-adapter.sh copilot /path/to/workspace
./scripts/install-codex-skill.sh
```

These create:

```text
/path/to/workspace/CLAUDE.md
/path/to/workspace/.cursor/rules/echobell-notify.mdc
/path/to/workspace/.windsurf/rules/echobell-notify.md
/path/to/workspace/.github/copilot-instructions.md
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify
```

## Recommended Environment Setup

Add the webhook URL to the shell profile that launches your agent:

```bash
export ECHOBELL_WEBHOOK_URL="https://hook.echobell.one/your-channel-id"
```

If you launch Codex from a GUI wrapper, make sure that wrapper inherits the same
environment variable.

## Update the Skill

Re-clone or pull the repo, then remove and reinstall the path you used:

```bash
./scripts/uninstall-skill.sh
./scripts/install-skill.sh
./scripts/uninstall-codex-skill.sh
./scripts/install-codex-skill.sh
```

If you used `AGENTS.md` or another adapter file, remove or merge that file in
the target workspace.

## Remove the generic skill

```bash
./scripts/uninstall-skill.sh
```

## Remove the Codex-native skill

```bash
./scripts/uninstall-codex-skill.sh
```

## Verify the Install

Generic skill destination should contain:

```text
${AGENT_SKILLS_HOME:-$HOME/.agents/skills}/echobell-notify/SKILL.md
```

Codex-native destination should contain:

```text
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify/SKILL.md
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify/agents/openai.yaml
```

Workspace-level installs should contain the expected adapter file, such as
`AGENTS.md`, `CLAUDE.md`, `.cursor/rules/echobell-notify.mdc`, or
`.windsurf/rules/echobell-notify.md`.

## Recommended order

1. `AGENTS.md`
2. generic skill directory
3. agent-native adapter
4. Codex-native local skill

