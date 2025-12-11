---
description: Create or convert a Claude Code skill
argument-hint: [skill-name or source-url]
---

# Create Skill

Use the skill-creator skill to guide the user through creating a new skill or converting an existing one.

If an argument is provided:
- If it looks like a URL or path, treat as conversion source
- Otherwise, treat as the name for a new skill

If no argument provided, ask whether to create new or convert existing.
