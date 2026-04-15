# Compatibility

This repository supports agents through three layers, in this order:

1. `AGENTS.md` repository instructions
2. `SKILL.md` skill directories
3. Agent-native adapter files

That order is intentional. It keeps the default installation path portable and
lets you drop to a vendor-specific format only when the agent benefits from it.

## Support Matrix

| Agent / runtime | Best install path | Notes |
| --- | --- | --- |
| OpenAI Codex | `AGENTS.md` or native Codex skill | Codex also supports `~/.codex/skills` |
| Claude Code | `CLAUDE.md` importing `AGENTS.md` | Native adapter included |
| Cursor | `AGENTS.md` or `.cursor/rules/*.mdc` | Both are supported |
| Windsurf | `AGENTS.md` or `.windsurf/rules/*.md` | Both are supported |
| GitHub Copilot CLI / cloud agent / VS Code agent mode | `AGENTS.md`, `.github/copilot-instructions.md`, or skill directory | Skill-aware runtime |
| Skill-aware runtimes that load `SKILL.md` folders | `skills/echobell-notify` copied into a skills root | Use `./scripts/install-skill.sh` |

## Generic First

Start with one of these generic options:

### Option A: Repository-level instructions

Install the portable `AGENTS.md` template into the target workspace:

```bash
./scripts/install-agent-adapter.sh agents-md /path/to/workspace
```

This is the best default when the agent reads repository instructions but does
not have a native skill loader.

### Option B: Generic skill directory

Install the skill folder into a skill root:

```bash
./scripts/install-skill.sh
```

By default that installs to:

```text
${AGENT_SKILLS_HOME:-$HOME/.agents/skills}/echobell-notify
```

Use this when your runtime supports `SKILL.md`-based skill discovery.

## Agent-native Adapters

Use native adapters when you want tighter integration:

- Claude Code: `./scripts/install-agent-adapter.sh claude-code <workspace>`
- Cursor: `./scripts/install-agent-adapter.sh cursor <workspace>`
- Windsurf: `./scripts/install-agent-adapter.sh windsurf <workspace>`
- GitHub Copilot: `./scripts/install-agent-adapter.sh copilot <workspace>`
- Codex native skill: `./scripts/install-codex-skill.sh`

## Official References

- OpenAI Codex and `AGENTS.md`: <https://openai.com/index/introducing-codex/>
- Claude Code memory, `CLAUDE.md`, and `@AGENTS.md` import:
  <https://code.claude.com/docs/en/memory>
- Cursor rules and `AGENTS.md`: <https://docs.cursor.com/en/context>
- Windsurf `AGENTS.md` and `.windsurf/rules`: <https://docs.windsurf.com/windsurf/cascade/agents-md>
- GitHub Copilot custom instructions:
  <https://docs.github.com/en/copilot/how-tos/copilot-cli/add-custom-instructions>
- GitHub Copilot skills:
  <https://docs.github.com/en/copilot/how-tos/use-copilot-agents/cloud-agent/create-skills>

