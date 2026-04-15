# Other Agents

This repository is no longer Codex-only.

The default install path is generic first:

1. `AGENTS.md`
2. `SKILL.md` skill directory
3. native adapters

## Claude Code

Use the included Claude adapter:

```bash
./scripts/install-agent-adapter.sh claude-code /path/to/workspace
```

This creates a `CLAUDE.md` that imports `AGENTS.md`, which matches Claude
Code's documented pattern for sharing instruction content across tools.

## Cursor

You can use either the generic `AGENTS.md` path or a native Cursor rule:

```bash
./scripts/install-agent-adapter.sh cursor /path/to/workspace
```

This creates:

```text
/path/to/workspace/.cursor/rules/echobell-notify.mdc
```

## Windsurf

You can use either the generic `AGENTS.md` path or a native Windsurf rule:

```bash
./scripts/install-agent-adapter.sh windsurf /path/to/workspace
```

## GitHub Copilot

For Copilot you have three workable paths:

1. root `AGENTS.md`
2. `.github/copilot-instructions.md`
3. a skill directory under `.github/skills`, `~/.copilot/skills`, or
   `~/.agents/skills`

This repository gives you both the Copilot instruction adapter and a generic
skill folder.

## Codex

Codex works with the generic `AGENTS.md` path, but it also has a native local
skills directory:

```bash
./scripts/install-codex-skill.sh
```

## Bottom line

Most agent setups should start with `AGENTS.md`.

Use the skill directory when the runtime supports `SKILL.md`.

Use vendor-specific files only when they provide a better native loading path.
