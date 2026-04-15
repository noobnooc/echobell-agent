# Installation

This repository currently ships a native Codex skill.

## Prerequisites

- Codex installed locally
- An Echobell webhook destination
- Shell access on the machine where Codex runs

You can use either:

- A channel webhook URL, or
- An Echobell Direct webhook URL

The skill prefers one environment variable:

```bash
export ECHOBELL_WEBHOOK_URL="https://hook.echobell.one/..."
```

## Option 1: Install From a Local Clone

Clone the repository and run the installer:

```bash
git clone git@github.com:noobnooc/echobell-agent.git
cd echobell-agent
./scripts/install-codex-skill.sh
```

The installer copies `skills/echobell-notify` into:

```text
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify
```

Then restart Codex.

## Option 2: Manual Install

Copy the skill directory yourself:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/echobell-notify "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Then restart Codex.

## Recommended Environment Setup

Add the webhook URL to the shell profile that launches Codex:

```bash
export ECHOBELL_WEBHOOK_URL="https://hook.echobell.one/your-channel-id"
```

If you launch Codex from a GUI wrapper, make sure that wrapper inherits the same
environment variable.

## Update the Skill

Re-clone or pull the repo, then remove and reinstall the skill:

```bash
./scripts/uninstall-codex-skill.sh
./scripts/install-codex-skill.sh
```

## Remove the Skill

```bash
./scripts/uninstall-codex-skill.sh
```

## Verify the Install

The destination should contain:

```text
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify/SKILL.md
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify/agents/openai.yaml
```

And Codex should pick it up after restart.

