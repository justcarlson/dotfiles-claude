# Investigate Session

Analyze the current session to identify where confusion occurred.

## Variables

CONFUSION_INDICATORS: repeated_attempts, contradictory_actions, user_correction, wrong_tool_used, misinterpreted_instruction, loop_detected

## Instructions

### Step 1: Scan Session for Confusion

- IF: Agent made multiple attempts at the same task.
- THEN: Flag as `repeated_attempts`.

- IF: Agent took an action then reversed it.
- THEN: Flag as `contradictory_actions`.

- IF: User corrected the agent or expressed frustration.
- THEN: Flag as `user_correction`.

- IF: Agent used wrong tool or skill for the task.
- THEN: Flag as `wrong_tool_used`.

- IF: Agent misunderstood user intent.
- THEN: Flag as `misinterpreted_instruction`.

- IF: Agent repeated same steps without progress.
- THEN: Flag as `loop_detected`.

### Step 2: Identify Affected Skill

- IF: Confusion occurred while a skill was active.
- THEN: Note skill name and file path.
- EXAMPLES:
  - "Skill `push-changes` was active when repeated_attempts occurred"
  - "Skill `skill-creator` was active when user_correction occurred"

- IF: No skill was active during confusion.
- THEN: Report "No skill involved - agent core behavior issue"

### Step 3: Document Findings

READ: `prompts/session_analysis.md`
Fill template IN MEMORY with:
- Confusion type(s) detected
- Skill name (if applicable)
- Skill file path
- Specific session moment (user message / agent response)
- What went wrong

## Workflow

1. Review session from most recent back to start.
2. Identify confusion indicators.
3. Correlate with active skills.
4. Document in session_analysis template.
5. Present findings to user for confirmation.
