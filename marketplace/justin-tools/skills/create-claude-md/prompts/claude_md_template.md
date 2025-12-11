# CLAUDE.md Template

Starter template covering six core areas.

---

```markdown
# CLAUDE.md

## Stack

<stack>
[Language] [version], [Framework] [version], [Key libraries]
</stack>

## Commands

### File-scoped (fast)

<file_commands>
# Typecheck
[command] path/to/file

# Lint
[command] path/to/file

# Test
[command] path/to/file
</file_commands>

### Project-wide

<project_commands>
[dev command]      # dev server
[test command]     # all tests
[build command]    # production
[lint command]     # lint all
</project_commands>

## Structure

<structure>
- `[entry]` - main file
- `[components]/` - UI
- `[api]/` - API client
- `[tests]/` - tests
</structure>

## Style

### Do

<do>
- [Preferred pattern 1]
- [Preferred pattern 2]
</do>

### Don't

<dont>
- [Anti-pattern 1]
- [Anti-pattern 2]
</dont>

### Examples

<examples>
- Components: `[path/to/good/component]`
- API: `[path/to/api/pattern]`
</examples>

## Testing

<testing>
- Framework: [framework]
- Run: `[command]`
- Pattern: [naming convention]
</testing>

## Git

<git>
- Commits: `type(scope): description`
- PR: [required checks]
</git>

## Boundaries

### Always

<always>
- [Required 1]
- [Required 2]
</always>

### Ask First

<ask>
- [Needs approval 1]
- [Needs approval 2]
</ask>

### Never

<never>
- Commit secrets
- [Prohibited 1]
</never>

## When Stuck

<stuck>
Ask a clarifying question or propose a plan.
</stuck>
```

---

## Section Guidelines

| Section | Lines | Focus |
|---------|-------|-------|
| Stack | 2-3 | Versions matter |
| Commands | 8-12 | File-scoped first |
| Structure | 6-8 | Key directories |
| Style | 10-15 | Real file examples |
| Testing | 3-4 | Framework, command |
| Git | 2-3 | Format, requirements |
| Boundaries | 8-12 | Specific, not generic |
| Stuck | 1-2 | Brief escape hatch |

**Total target: 50-150 lines**
