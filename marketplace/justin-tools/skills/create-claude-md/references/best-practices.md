# CLAUDE.md Best Practices

Compiled from analysis of effective project documentation for AI agents.

## Core Insight

The best CLAUDE.md files give agents a **specific persona** and a **detailed operating manual**. "You are a helpful coding assistant" fails. "You are a test engineer who writes tests for React components, follows these examples, and never modifies source code" succeeds.

## Six Core Areas

### 1. Commands (Put Early)

Include exact commands with flags:

```markdown
## Commands

# Type check single file (fast)
npm run tsc --noEmit path/to/file.tsx

# Lint single file
npm run eslint --fix path/to/file.tsx

# Run specific test
npm run vitest run path/to/file.test.tsx
```

**Why file-scoped**: Full builds take minutes; single-file checks take seconds.

### 2. Testing

```markdown
## Testing

- Run: `npm test` before commits
- Coverage: maintain >80% for new code
- Pattern: `*.test.tsx` colocated with source
```

### 3. Project Structure

```markdown
## Structure

- `src/App.tsx` - routes and main layout
- `src/components/` - reusable UI
- `src/api/client.ts` - typed API client
```

### 4. Code Style

Examples beat explanations:

```markdown
## Style

- Prefer functional components like `src/components/UserCard.tsx`
- Avoid class components like `src/legacy/Admin.tsx`
- Forms: copy pattern from `src/components/Form.Field.tsx`
```

### 5. Git Workflow

```markdown
## Git

- Title: `feat(scope): short description`
- Tests must pass before merge
```

### 6. Boundaries (Three Tiers)

```markdown
## Boundaries

**Always:**
- Run lint on modified files
- Write tests for new code

**Ask first:**
- Adding dependencies
- Schema changes

**Never:**
- Commit secrets
- Push to main without PR
```

## Token Efficiency

### Assume Intelligence

Only add context Claude doesn't have:
- Project-specific conventions
- Non-obvious file locations
- Custom tooling

### Progressive Disclosure

Main CLAUDE.md as table of contents:

```markdown
## API Docs

See `docs/api/*.md` for details.
Use client in `src/api/client.ts`.
```

### File-Scoped Commands

```markdown
# Fast (seconds)
npm run tsc --noEmit path/to/file.tsx

# Slow (minutes) - use sparingly
npm run build
```

## Anti-Patterns

1. **Too vague**: "Write clean code"
2. **Version ambiguity**: "React project"
3. **No examples**: Paragraphs instead of code
4. **Sensitive info**: API keys, credentials
5. **Stale content**: Not updated as project evolves
