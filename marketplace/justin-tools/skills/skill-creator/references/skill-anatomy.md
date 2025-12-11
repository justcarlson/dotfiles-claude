# Skill Anatomy

Structure and components of a Claude Code plugin skill.

## Directory Structure

```
skill-name/
├── SKILL.md (required)
│   ├── YAML frontmatter metadata (required)
│   │   ├── name: (required)
│   │   └── description: (required)
│   └── Markdown instructions (required)
└── Bundled Resources (optional)
    ├── scripts/          - Executable code (Python/Bash/etc.)
    ├── references/       - Documentation loaded as needed
    ├── examples/         - Working code examples
    └── cookbook/         - Workflow branch files
```

## SKILL.md Structure

### Frontmatter (Required)

```yaml
---
name: skill-name
description: This skill should be used when the user asks to "specific phrase 1", "specific phrase 2". Provides X functionality.
---
```

**Description quality matters:**
- Use third person: "This skill should be used when..."
- Include specific trigger phrases users would say
- Be concrete: "create a hook", "add a PreToolUse hook"

### Body Structure

```markdown
# Purpose

One-paragraph summary of what the skill does.

## Variables

CONFIG_OPTION: value
ANOTHER_OPTION: value

## Instructions

### Section Name

- IF: Condition.
- THEN: Action to take.
- EXAMPLES:
  - "user phrase 1"
  - "user phrase 2"

## Workflow

1. First step
2. Second step
3. Third step

## Cookbook

### Path A

- IF: Condition for this path.
- THEN: READ and execute: `cookbook/path-a.md`

### Path B

- IF: Condition for this path.
- THEN: READ and execute: `cookbook/path-b.md`

## References

- READ: `references/file.md` - Description of what it contains
```

## Bundled Resources

### Scripts (`scripts/`)

Executable code for deterministic, repeatable tasks.

**When to include:**
- Same code would be rewritten repeatedly
- Deterministic reliability needed
- Complex shell operations

**Example:** `scripts/validate.sh`, `scripts/process.py`

### References (`references/`)

Documentation loaded into context as needed.

**When to include:**
- Detailed patterns and techniques
- API documentation
- Domain knowledge
- Team conventions

**Example:** `references/patterns.md`, `references/api-docs.md`

### Examples (`examples/`)

Working code that users can copy and adapt.

**When to include:**
- Complete, runnable scripts
- Configuration templates
- Real-world usage patterns

**Example:** `examples/config.json`, `examples/workflow.sh`

### Cookbook (`cookbook/`)

Separate files for different workflow branches.

**When to include:**
- Multiple distinct paths through the skill
- Complex conditional workflows
- Different modes of operation

**Example:** `cookbook/simple-mode.md`, `cookbook/advanced-mode.md`

## Progressive Disclosure

Keep SKILL.md lean (1500-2000 words ideal):

1. **Core concepts** - In SKILL.md
2. **Detailed patterns** - In `references/`
3. **Working examples** - In `examples/`
4. **Complex workflows** - In `cookbook/`

## Token Efficiency

- Only include what Claude doesn't already know
- Code examples beat paragraphs of explanation
- Reference files for detailed content
- Keep main file scannable
