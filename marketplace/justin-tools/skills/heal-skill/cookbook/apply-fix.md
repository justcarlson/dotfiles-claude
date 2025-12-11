# Apply Fix

Apply the fix to the affected skill with user approval and backup.

## Variables

REQUIRE_USER_APPROVAL: true
CREATE_BACKUP: true
BACKUP_SUFFIX: .backup

## Instructions

### Step 1: Create Backup

- IF: `CREATE_BACKUP` is true.
- THEN: Copy original SKILL.md to SKILL.md.backup

### Step 2: Present Fix for Approval

- IF: `REQUIRE_USER_APPROVAL` is true.
- THEN: Show user the proposed change and ask for confirmation.
- FORMAT:
  ```
  ## Proposed Fix for <skill-name>
  
  **Root Cause:** <root_cause_type>
  **Location:** <section in SKILL.md>
  
  **Before:**
  <original_text>
  
  **After:**
  <fixed_text>
  
  **Rationale:** <why_this_fixes_the_issue>
  
  Apply this fix? (yes/no)
  ```

### Step 3: Apply Fix

- IF: User approves.
- THEN: Edit the SKILL.md file with the fix.

- IF: User rejects.
- THEN: Ask for feedback and revise diagnosis.

### Step 4: Verify Fix

After applying:
1. READ: Updated SKILL.md to confirm change applied.
2. Validate YAML frontmatter syntax.
3. Report success to user.

## Workflow

1. Create backup if enabled.
2. Present fix for user approval.
3. Apply fix upon approval.
4. Verify fix applied correctly.
5. Report completion.
