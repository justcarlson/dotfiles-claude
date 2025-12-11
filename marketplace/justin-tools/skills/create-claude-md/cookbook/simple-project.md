# Simple Project Cookbook

Create CLAUDE.md for a single-repo project with unified tech stack.

## Workflow

### Step 1: Analyze Project

Gather information:

```bash
# Package manager
ls package.json pyproject.toml requirements.txt Cargo.toml go.mod 2>/dev/null

# Scripts available
cat package.json | jq '.scripts' 2>/dev/null
cat Makefile 2>/dev/null | grep -E '^[a-zA-Z_-]+:'

# Structure
find . -type f -name "*.ts" -o -name "*.tsx" -o -name "*.py" | head -30
ls -la src/ app/ lib/ 2>/dev/null

# Tests
ls -la tests/ test/ __tests__/ 2>/dev/null
```

### Step 2: Extract Key Information

- [ ] **Stack**: Language, framework, versions
- [ ] **Package manager**: npm/yarn/pip/cargo
- [ ] **Commands**: dev, build, test, lint
- [ ] **Entry points**: Main app, routes, config
- [ ] **Test setup**: Framework, patterns

### Step 3: Conduct Discovery (if needed)

- IF: Analysis sufficient.
- THEN: Skip to Step 4.

- IF: Missing information.
- THEN: READ `prompts/discovery_template.md` and ask questions.

### Step 4: Generate CLAUDE.md

1. READ: `prompts/claude_md_template.md`
2. Fill sections from analysis
3. Apply best practices:
   - Commands early with flags
   - Code examples over explanations
   - Three-tier boundaries
   - File-scoped commands preferred

### Step 5: Optimize

- Remove obvious explanations
- Convert paragraphs to bullets
- Replace descriptions with file paths
- Keep under 150 lines

### Step 6: Present Draft

```
Here's the CLAUDE.md based on your project:

[content]

Shall I:
1. Write this to the repository root?
2. Make adjustments?
```

## Example Output

```markdown
# CLAUDE.md

## Stack
React 18.2, TypeScript 5.3, Vite 5.0, Tailwind 3.4

## Commands

### File-scoped (fast)
npx tsc --noEmit src/path/to/file.tsx
npx eslint --fix src/path/to/file.tsx
npm run test -- src/path/to/file.test.tsx

### Project-wide
npm run build
npm run test
npm run lint

## Structure
- `src/App.tsx` - routes and layout
- `src/components/` - reusable UI
- `src/api/` - API client

## Style

### Do
- Functional components with hooks
- Tailwind classes, not inline styles

### Examples
- Components: `src/components/Button.tsx`
- API: `src/api/client.ts`

### Don't
- Class components
- Direct fetch (use API client)

## Testing
- Vitest + React Testing Library
- `npm test` or single file

## Git
- Commits: `type(scope): description`

## Boundaries

### Always
- Lint changed files
- Tests for new components

### Ask First
- Adding dependencies

### Never
- Commit `.env`

## When Stuck
Ask a clarifying question.
```
