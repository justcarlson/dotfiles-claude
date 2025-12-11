# dotfiles-claude

Personal Claude Code plugin with skills and commands for everyday workflows.

## Philosophy

These tools follow the **no-ambiguity pattern**: explicit conditions, clear examples, and deterministic behavior. Every skill uses IF/THEN/EXAMPLES blocks so Claude knows exactly what to do.

Converted from [dotfiles-factory](https://github.com/justcarlson/dotfiles-factory) for Claude Code.

## What's Inside

**[Commands](#commands)** (5 total) - Slash commands for common tasks

- **Git Workflow**: Push changes with conventional commits
- **Parallel Development**: Create and manage git worktrees
- **Skill Management**: Create, convert, and fix skills
- **Documentation**: Generate CLAUDE.md files

**[Skills](#skills)** (5 total) - Autonomous workflows with supporting files

- **push-changes**: Stage, commit with conventional messages, push
- **manage-worktrees**: Git worktree management for parallel Claude sessions
- **skill-creator**: Create new skills or convert from other platforms
- **heal-skill**: Diagnose and fix skills that caused confusion
- **create-claude-md**: Generate token-efficient CLAUDE.md files

## Installation

### Plugin Install (Recommended)

```bash
# In Claude Code session:
/plugin marketplace add ~/dev/dotfiles-claude/marketplace
/plugin install justin-tools@dotfiles-claude
```

Restart Claude Code to use the commands and skills.

### From GitHub

```bash
# Clone the repo
git clone https://github.com/justcarlson/dotfiles-claude.git ~/dev/dotfiles-claude

# Then add plugin in Claude Code session
/plugin marketplace add ~/dev/dotfiles-claude/marketplace
/plugin install justin-tools@dotfiles-claude
```

## Commands

### Git Workflow

- [`/push`](marketplace/justin-tools/commands/push.md) - Stage, commit with conventional messages, and push
- [`/worktree`](marketplace/justin-tools/commands/worktree.md) - Create, list, cleanup, or sync git worktrees

### Skill Management

- [`/create-skill`](marketplace/justin-tools/commands/create-skill.md) - Create or convert Claude Code skills
- [`/heal-skill`](marketplace/justin-tools/commands/heal-skill.md) - Fix skills based on session confusion

### Documentation

- [`/claude-md`](marketplace/justin-tools/commands/claude-md.md) - Generate CLAUDE.md for current project

## Skills

### [push-changes](marketplace/justin-tools/skills/push-changes)

Conventional commit workflow. Auto-detects commit type from changes, stages everything, commits with proper format, and pushes.

**Includes:** `scripts/smart_commit.sh`, `references/conventional-commits.md`

**Triggers:** "push changes", "commit and push", "push this", "push to github"

### [manage-worktrees](marketplace/justin-tools/skills/manage-worktrees)

Git worktree management for running parallel Claude sessions. Create feature worktrees, sync with main, cleanup merged branches.

**Includes:** 4 shell scripts, 2 reference docs

**Triggers:** "create a worktree", "list worktrees", "cleanup worktrees", "sync worktree"

### [skill-creator](marketplace/justin-tools/skills/skill-creator)

Create new skills from scratch or convert existing ones from Factory Droid, GitHub, or other platforms. Interactive discovery with questionnaire.

**Includes:** 2 cookbooks, 2 prompts, 3 references

**Triggers:** "create a skill", "convert a skill", "make a new skill"

### [heal-skill](marketplace/justin-tools/skills/heal-skill)

Analyze session confusion to identify problematic skills. Diagnose root cause and apply fixes with user approval.

**Includes:** 3 cookbooks, 2 prompts, 1 reference

**Triggers:** "heal skill", "fix the skill", "that skill confused you"

### [create-claude-md](marketplace/justin-tools/skills/create-claude-md)

Generate token-efficient CLAUDE.md files. Analyzes project structure, identifies tech stack, creates documentation covering six core areas.

**Includes:** 2 cookbooks, 2 prompts, 2 references

**Triggers:** "create CLAUDE.md", "make CLAUDE.md", "init claude"

---

## Structure

```
dotfiles-claude/
├── marketplace/
│   ├── .claude-plugin/
│   │   └── marketplace.json
│   └── justin-tools/
│       ├── .claude-plugin/
│       │   └── plugin.json
│       ├── commands/           # 5 slash commands
│       ├── skills/             # 5 skills with supporting files
│       └── agents/             # Future subagents
├── install.sh
├── uninstall.sh
└── README.md
```

## Adding New Skills

```bash
# Create skill directory
mkdir -p marketplace/justin-tools/skills/my-skill/{references,scripts}

# Create SKILL.md with frontmatter
cat > marketplace/justin-tools/skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: This skill should be used when the user asks to "trigger phrase 1", "trigger phrase 2".
---

# Purpose
...
EOF

# Reinstall plugin
/plugin uninstall justin-tools@dotfiles-claude
/plugin install justin-tools@dotfiles-claude
```

## Adding New Commands

```bash
cat > marketplace/justin-tools/commands/my-command.md << 'EOF'
---
description: What this command does
argument-hint: [optional-args]
---

Instructions for Claude when command is invoked.
EOF
```

---

More tools coming as workflows evolve.

— Justin
