# dotfiles-claude

Personal collection of Claude Code skills, commands, and productivity tools.

Converted from [dotfiles-factory](https://github.com/YOUR_USERNAME/dotfiles-factory) for use with Claude Code.

## Contents

### Skills (model-invoked)

| Skill | Description |
|-------|-------------|
| `push-changes` | Stage, commit with conventional messages, and push |
| `manage-worktrees` | Git worktree management for parallel development |
| `skill-creator` | Create new Claude Code skills or convert existing ones |
| `heal-skill` | Analyze and fix skills that caused confusion |
| `create-claude-md` | Generate token-efficient CLAUDE.md files |

### Commands (user-invoked)

| Command | Description |
|---------|-------------|
| `/push` | Commit and push changes |
| `/worktree` | Manage git worktrees |
| `/heal-skill` | Fix problematic skills |
| `/create-skill` | Create or convert skills |
| `/claude-md` | Create CLAUDE.md for current project |

## Installation

### Step 1: Clone the repository

```bash
git clone git@github.com:YOUR_USERNAME/dotfiles-claude.git ~/dev/dotfiles-claude
```

### Step 2: Add marketplace and install plugin

In a Claude Code session, run:

```
/plugin marketplace add ~/dev/dotfiles-claude/marketplace
/plugin install justin-tools@dotfiles-claude
```

### Step 3: Restart Claude Code

The plugin will be available after restarting.

## Uninstallation

In a Claude Code session:

```
/plugin uninstall justin-tools@dotfiles-claude
/plugin marketplace remove dotfiles-claude
```

## Usage

After installation, skills are automatically available based on trigger phrases:

- "push changes" → triggers `push-changes` skill
- "create a worktree" → triggers `manage-worktrees` skill
- "create a skill" → triggers `skill-creator` skill
- "heal skill" → triggers `heal-skill` skill
- "create CLAUDE.md" → triggers `create-claude-md` skill

Or use slash commands directly:

```
/push
/worktree create feature-auth
/heal-skill
/create-skill my-new-skill
/claude-md
```

## Structure

```
dotfiles-claude/
├── marketplace/                        # Local plugin marketplace
│   ├── .claude-plugin/
│   │   └── marketplace.json
│   └── justin-tools/                   # Personal plugin
│       ├── .claude-plugin/
│       │   └── plugin.json
│       ├── commands/                   # Slash commands
│       │   ├── push.md
│       │   ├── worktree.md
│       │   ├── heal-skill.md
│       │   ├── create-skill.md
│       │   └── claude-md.md
│       ├── skills/                     # Model-invoked skills
│       │   ├── push-changes/
│       │   ├── manage-worktrees/
│       │   ├── skill-creator/
│       │   ├── heal-skill/
│       │   └── create-claude-md/
│       └── agents/                     # Subagents (future)
├── install.sh
├── uninstall.sh
└── README.md
```

## Key Differences from Factory Droid

| Feature | Factory Droid | Claude Code |
|---------|---------------|-------------|
| Personal skills | `~/.factory/skills/` | Plugin only |
| Personal commands | `~/.factory/commands/` | `~/.claude/commands/` or plugin |
| Agents/Droids | `~/.factory/droids/` | Plugin `agents/` only |
| Project instructions | `.factory/agents.md` | `CLAUDE.md` |

## Adding New Skills

1. Create skill directory in `marketplace/justin-tools/skills/<skill-name>/`
2. Add `SKILL.md` with YAML frontmatter
3. Reinstall plugin: `/plugin uninstall justin-tools@dotfiles-claude && /plugin install justin-tools@dotfiles-claude`

## Adding New Commands

1. Create markdown file in `marketplace/justin-tools/commands/<command-name>.md`
2. Add YAML frontmatter with `description`
3. Reinstall plugin to pick up changes

## License

MIT
