# Common Skill Confusion Patterns

Reference guide for diagnosing skill issues.

## Pattern 1: Ambiguous Branching

**Symptom:** Agent can't decide which cookbook path to follow.

**Cause:** IF conditions overlap or aren't mutually exclusive.

**Example Problem:**
```markdown
- IF: User wants to deploy.
- THEN: Follow deploy cookbook.

- IF: User mentions production.
- THEN: Follow production cookbook.
```
User says "deploy to production" - which path?

**Fix:** Make conditions mutually exclusive:
```markdown
- IF: User wants to deploy to production specifically.
- THEN: Follow production cookbook.
- EXAMPLES:
  - "deploy to production"
  - "push to prod"

- IF: User wants to deploy (non-production).
- THEN: Follow deploy cookbook.
- EXAMPLES:
  - "deploy to staging"
  - "deploy this"
```

---

## Pattern 2: Missing Examples

**Symptom:** Skill doesn't activate on expected phrases.

**Cause:** Description or IF/THEN blocks lack example triggers.

**Fix:** Add EXAMPLES with actual phrases:
```markdown
- IF: User wants to push code.
- THEN: Execute git workflow.
- EXAMPLES:
  - "push this"
  - "commit and push"
  - "push to github"
```

---

## Pattern 3: Implicit File References

**Symptom:** Agent can't find referenced files.

**Cause:** File paths not explicit.

**Fix:** Use explicit READ: paths:
```markdown
## References

- READ: `references/schema.md` - Database schema
- READ: `references/conventions.md` - Team standards
```

---

## Pattern 4: Missing Variables

**Symptom:** Agent uses wrong values or asks for info that should be configured.

**Fix:** Add Variables section:
```markdown
## Variables

DEFAULT_MODEL: sonnet
HEAVY_MODEL: opus
```

---

## Pattern 5: Unclear Workflow Steps

**Symptom:** Agent skips steps or executes out of order.

**Fix:** Use numbered explicit steps:
```markdown
## Workflow

1. Understand the user's request.
2. READ: `references/constraints.md`
3. Execute the appropriate cookbook.
4. Verify with `command --check`.
```

---

## Pattern 6: Wrong Tool Selection

**Symptom:** Agent uses incorrect tool.

**Fix:** Specify tool explicitly:
```markdown
- IF: Creating a new file.
- THEN: Use the Create tool with full path.

- IF: Modifying existing file.
- THEN: Use the Edit tool.
```

---

## Pattern 7: Loop Detection Failure

**Symptom:** Agent repeats same action without progress.

**Fix:** Add exit conditions:
```markdown
## Workflow

1. Try to build: `npm run build`
2. IF: Build succeeds. THEN: Proceed to step 4.
3. IF: Build fails. THEN: Fix and retry (max 3 attempts).
4. IF: Still failing. THEN: Report failure to user.
```

---

## Diagnosis Checklist

- [ ] Are IF conditions mutually exclusive?
- [ ] Do all IF/THEN blocks have EXAMPLES?
- [ ] Are file paths explicit with READ: prefix?
- [ ] Is there a Variables section?
- [ ] Is the Workflow a numbered list?
- [ ] Are tools specified explicitly?
- [ ] Are there exit conditions for loops?
- [ ] Does description include trigger phrases?
