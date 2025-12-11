# CLAUDE.md Discovery Questions

Use when automatic analysis is insufficient.
Ask 2-3 questions at a time.

## Phase 1: Stack & Commands

**Q1: What's your tech stack?**
- Framework and version
- Language and version
- Key libraries

**Q2: What commands do you run most often?**
- Dev server
- Tests
- Lint/format
- Build

## Phase 2: Conventions

**Q3: Where are the key files?**
- Entry point
- Components directory
- API client
- Config files

**Q4: What patterns should be followed?**
- Coding conventions?
- Files as "good" examples?
- Legacy to avoid?

## Phase 3: Boundaries

**Q5: What should Claude always do?**
- Required checks?
- Mandatory patterns?

**Q6: What should Claude never do?**
- Off-limits files?
- Actions needing approval?

## Phase 4: Scope

**Q7: Is this a monorepo?**
- Multiple apps/packages?
- Need separate CLAUDE.md per package?

## Quick Assessment

Single comprehensive question:

```
To create CLAUDE.md, I need:

1. **Stack**: Language/framework (with versions)?
2. **Commands**: dev/test/lint/build command?
3. **Structure**: Where are components, API, tests?
4. **Style**: File to use as "golden example"?
5. **Boundaries**: What to never touch or always do?

Brief answers fine - I'll analyze the codebase for details.
```
