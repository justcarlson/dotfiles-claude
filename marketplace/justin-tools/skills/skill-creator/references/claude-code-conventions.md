# Claude Code Plugin Conventions

Claude Code-specific guidelines for skill development.

## Skill Locations

| Scope | Location | Purpose |
|-------|----------|---------|
| Plugin | `plugin-name/skills/<name>/` | Bundled with plugin, installed via marketplace |
| Project | `.claude/commands/` | Project-specific slash commands |
| Personal | `~/.claude/commands/` | Personal slash commands (not skills) |

**Note:** Claude Code does NOT support `~/.claude/skills/` - skills must be in plugins.

## File Formats

- `SKILL.md` - Standard markdown with YAML frontmatter (required)
- Supporting directories: `references/`, `examples/`, `scripts/`

## Naming Conventions

Skill names should be descriptive and use kebab-case:

**Good examples:**
- `push-changes`
- `manage-worktrees`
- `code-review`

**Bad examples:**
- `PushChanges` (no camelCase)
- `push_changes` (no underscores)

## Frontmatter Requirements

**Supported fields:**
```yaml
---
name: skill-name
description: This skill should be used when the user asks to "phrase1", "phrase2". Detailed description here.
---
```

**Description style:** Use third-person format with specific trigger phrases.

## Path References

When referencing files within a skill:
- Use relative paths: `references/file.md`
- Use `@` syntax for file includes in commands: `@references/file.md`

## Plugin-Specific Features

### ${CLAUDE_PLUGIN_ROOT}

Environment variable available in plugin contexts:
```markdown
# Access plugin files
@${CLAUDE_PLUGIN_ROOT}/references/docs.md
```

### Progressive Disclosure

1. **Metadata (name + description)** - Always in context (~100 words)
2. **SKILL.md body** - When skill triggers (<5k words ideal)
3. **References** - As needed by Claude (unlimited)

## No-Ambiguity Pattern

Skills should follow clear conditional logic:

### Variables Section

Define configuration at the top:
```markdown
## Variables

ENABLE_FEATURE: true
DEFAULT_VALUE: something
```

### IF/THEN/EXAMPLES

Use explicit conditional logic:
```markdown
- IF: User requests X.
- THEN: Do Y.
- EXAMPLES:
  - "example phrase 1"
  - "example phrase 2"
```

### Imperative Writing Style

Use verb-first instructions (imperative form), not second person:
- Good: "Run the test suite before committing."
- Bad: "You should run the test suite before committing."

## Skills vs Commands

| Type | Location | Invocation |
|------|----------|------------|
| Skills | `plugin/skills/<name>/SKILL.md` | Model-invoked based on triggers |
| Commands | `plugin/commands/<name>.md` or `~/.claude/commands/` | User-invoked with `/command` |

## Verification Checklist

After creating a skill:
- [ ] SKILL.md has valid YAML frontmatter with `name` and `description`
- [ ] Description uses third-person and includes trigger phrases
- [ ] Body uses imperative writing style
- [ ] Variables section defined (if applicable)
- [ ] IF/THEN/EXAMPLES used for branching logic
- [ ] SKILL.md is lean (<2000 words), detailed content in references/
- [ ] All referenced files exist
