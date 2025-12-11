# Convert Existing Skill

Convert an existing skill from another platform to Claude Code plugin format.

## Variables

SOURCE_PLATFORMS: github, factory, claude-skills-marketplace, local-path
PATH_REPLACEMENTS: ~/.factory/ -> relative paths, .factory/ -> .claude/

## Instructions

### Step 1: Identify Source

- IF: User provides a GitHub URL.
- THEN: Extract raw file URLs and use `FetchUrl` tool.
- EXAMPLES:
  - Input: `https://github.com/user/repo/tree/main/skills/skill-name`
  - Raw URL: `https://raw.githubusercontent.com/user/repo/main/skills/skill-name/SKILL.md`

- IF: User provides a Factory skill path.
- THEN: Use `Read` tool to access files directly.
- EXAMPLES:
  - Input: `~/.factory/skills/skill-name`
  - Read: `~/.factory/skills/skill-name/SKILL.md`

- IF: User provides a local path.
- THEN: Use `Read` tool to access files directly.
- EXAMPLES:
  - Input: `~/dev/repo/.claude/skills/skill-name`

### Step 2: Fetch and Analyze

1. Fetch the SKILL.md file first.
2. Identify directory structure:
   - `scripts/` - executable code
   - `references/` - documentation
   - `cookbook/` - workflow branches
   - `prompts/` - templates
   - `examples/` - working examples
3. List all files to convert.

### Step 3: Adapt for Claude Code

#### Path Replacements

Replace all occurrences:
```
~/.factory/skills/     -> relative paths within plugin
~/.factory/commands/   -> plugin commands/ directory
.factory/              -> .claude/
```

#### Description Style

Convert to third-person with trigger phrases:
- Before: `Use this when user requests "push changes"...`
- After: `This skill should be used when the user asks to "push changes"...`

#### Frontmatter

- KEEP: `name`, `description`
- REMOVE: `version`, `author`, `category`, `license`, `tags` (if present)

#### Script Adjustments

- Ensure shebangs are portable: `#!/usr/bin/env bash`, `#!/usr/bin/env python3`
- Update any hardcoded paths to be relative or use `${CLAUDE_PLUGIN_ROOT}`
- Remove Factory-specific tool references

### Step 4: Create Skill in Plugin

1. Create skill directory in plugin:
   ```
   plugin-name/skills/<skill-name>/
   ```

2. Write adapted SKILL.md

3. Copy/create supporting files:
   - Scripts to `scripts/`
   - References to `references/`
   - Cookbooks to `cookbook/`
   - Examples to `examples/`

4. Make scripts executable:
   ```bash
   chmod +x skills/<skill-name>/scripts/*
   ```

## Workflow

1. Get source URL or path from user.
2. Fetch SKILL.md and identify structure.
3. Fetch all supporting files.
4. Apply path replacements and description style fixes.
5. Create skill in plugin.
6. Verify with tree command.

## Verification

Run after completion:
```bash
tree -a plugin-name/skills/<skill-name>/
```

Confirm:
- [ ] SKILL.md has valid YAML frontmatter
- [ ] Description uses third-person with trigger phrases
- [ ] All scripts are executable
- [ ] Paths are relative or use ${CLAUDE_PLUGIN_ROOT}
- [ ] No Factory-specific references remain
