---
name: skill-creator
description: This skill should be used when the user asks to "create a skill", "convert a skill", "make a new skill", "build a skill", or asks about skill development for Claude Code plugins.
---

Create new Claude Code skills or convert existing ones from other platforms.

# Purpose

Create excellent skills for Claude Code plugins. Either convert an existing skill from another platform, or create a new skill from scratch.
Follow the `Instructions`, execute the `Workflow`, based on the `Cookbook`.

## Variables

ENABLE_EXA_RESEARCH: true
ENABLE_REF_RESEARCH: true
ENABLE_GITHUB_FETCH: true
DEFAULT_SKILL_LOCATION: plugin skills/ directory
WORKSPACE_SKILL_LOCATION: .claude/commands/ (for simple commands)

## Instructions

- Based on the user's request, follow the `Cookbook` to determine which path to use.
- Always use the no-ambiguity pattern: Variables, IF/THEN/EXAMPLES, explicit file paths.
- Skills created should follow Claude Code plugin conventions.

### Determining the Path

- IF: User wants to convert/adapt an existing skill from GitHub, Factory, or local path.
- THEN: Follow the `Convert Existing Skill` cookbook.
- EXAMPLES:
  - "convert this skill to Claude Code: https://github.com/..."
  - "adapt the git-pushing skill from claude-skills-marketplace"
  - "import skill from ~/dev/some-repo/.factory/skills/skill-name"

- IF: User wants to create a brand new skill from scratch.
- THEN: Follow the `Create New Skill` cookbook.
- EXAMPLES:
  - "create a skill for deploying to kubernetes"
  - "make a new skill that automates PR reviews"
  - "build a skill for database migrations"

### Slash Command Creation

- IF: Skill would benefit from a user-invoked slash command.
- THEN: Offer to create a command in the plugin's `commands/` directory.
- EXAMPLES:
  - "Should I also create a `/deploy` command for this skill?"
  - "Would you like a slash command to trigger this skill?"

## Workflow

1. Understand the user's request.
2. Ask: "Would you like to **convert an existing skill** or **create a new skill from scratch**?"
3. Follow the appropriate `Cookbook` based on response.
4. READ: `references/claude-code-conventions.md` for Claude Code-specific rules.
5. Create skill files in the appropriate location.

## Cookbook

### Convert Existing Skill

- IF: User provides a GitHub URL, Factory skill path, or local path to an existing skill.
- THEN: READ and execute: `cookbook/convert-existing.md`
- EXAMPLES:
  - "convert https://github.com/user/repo/tree/main/skills/git-pushing"
  - "adapt the fork-terminal skill from ~/.factory/skills/"
  - "import skill from claude-skills-marketplace"

### Create New Skill

- IF: User wants to create a skill that doesn't exist yet.
- THEN: READ and execute: `cookbook/create-new.md`
- EXAMPLES:
  - "create a skill for running database migrations"
  - "make a skill that helps with code reviews"
  - "build a deployment automation skill"

## References

Load explicitly when needed:
- READ: `references/skill-anatomy.md` - Skill structure & components
- READ: `references/claude-code-conventions.md` - Claude Code plugin rules
- READ: `references/example-skills.md` - Working skill examples
