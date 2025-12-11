# Example Skills

Curated examples demonstrating the no-ambiguity pattern for Claude Code plugins.

## Pattern 1: Simple Workflow with Script

**Structure:**
```
push-changes/
├── SKILL.md
├── scripts/
│   └── smart_commit.sh
└── references/
    └── conventional-commits.md
```

**SKILL.md (no-ambiguity pattern):**
```markdown
---
name: push-changes
description: This skill should be used when the user asks to "push changes", "commit and push", "push this", "push to github".
---

# Purpose

Stage all changes, create a conventional commit, and push to remote.
Follow the `Instructions`, execute the `Workflow`.

## Variables

CO_AUTHOR: Claude <noreply@anthropic.com>

## Instructions

- IF: User wants to push with a custom commit message.
- THEN: Pass message as argument to script.
- EXAMPLES:
  - "push changes with message feat: add login"
  - "commit and push: fix: resolve bug"

## Workflow

1. Check for changes: `git status`
2. Stage changes: `git add -A`
3. Generate or use provided commit message
4. Commit and push

## References

- READ: `references/conventional-commits.md` - Full commit specification
```

---

## Pattern 2: Multi-Path with Cookbook

**Structure:**
```
skill-creator/
├── SKILL.md
├── cookbook/
│   ├── convert-existing.md
│   └── create-new.md
├── references/
│   ├── skill-anatomy.md
│   └── claude-code-conventions.md
└── prompts/
    └── skill_questionnaire.md
```

**SKILL.md (no-ambiguity pattern):**
```markdown
---
name: skill-creator
description: This skill should be used when the user asks to "create a skill", "convert a skill", "make a new skill", or asks about skill development.
---

# Purpose

Create excellent skills for Claude Code plugins.
Follow the `Instructions`, execute the `Workflow`, based on the `Cookbook`.

## Variables

ENABLE_RESEARCH: true
DEFAULT_LOCATION: plugin skills/ directory

## Instructions

- Based on the user's request, follow the `Cookbook` to determine which path to use.

## Workflow

1. Understand the user's request.
2. Ask: "Would you like to **convert an existing skill** or **create a new skill**?"
3. Follow the appropriate `Cookbook` based on response.

## Cookbook

### Convert Existing Skill

- IF: User provides a URL or path to an existing skill.
- THEN: READ and execute: `cookbook/convert-existing.md`
- EXAMPLES:
  - "convert this skill: https://github.com/..."
  - "adapt the skill from ~/.factory/skills/skill-name"

### Create New Skill

- IF: User wants to create a skill from scratch.
- THEN: READ and execute: `cookbook/create-new.md`
- EXAMPLES:
  - "create a skill for deploying to kubernetes"
  - "make a new skill that automates PR reviews"
```

---

## Pattern 3: Prompts with XML Tags

**Template file (`prompts/summary_template.md`):**
```markdown
# Summary

<conversation_history>
fill_in_conversation_summary_here
</conversation_history>

<next_request>
fill_in_next_user_request_here
</next_request>
```

**Usage in SKILL.md:**
```markdown
## Instructions

### Summary Handoff

- IF: User requests context handoff.
- THEN: 
  - READ: `prompts/summary_template.md`
  - Fill out template IN MEMORY with conversation history.
  - Pass filled template to the next session.
- EXAMPLES:
  - "hand off with summary"
  - "create context for new session"
```

---

## Pattern 4: Explicit References

**SKILL.md excerpt:**
```markdown
## References

Load explicitly when needed:
- READ: `references/schema.md` - Database table schemas
- READ: `references/patterns.md` - Common patterns
- READ: `references/conventions.md` - Team conventions
```

---

## Anti-Patterns to Avoid

| Anti-Pattern | Problem | Fix |
|--------------|---------|-----|
| Vague description | Won't activate reliably | Add specific trigger phrases in third person |
| Prose instructions | Ambiguous for LLM | Use IF/THEN/EXAMPLES |
| Implicit file loads | LLM may not find files | Use explicit `READ:` paths |
| Missing Variables | Configuration buried in text | Add Variables section |
| No verification | Can't confirm success | Add Verification section |
| Second person | Inconsistent style | Use imperative form |
