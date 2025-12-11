# Skill Summary Template

Fill out this template IN MEMORY after completing the questionnaire.
Replace all XML-tagged sections with gathered information.
Present to user for confirmation before implementation.

---

## Skill Summary

<skill_name>
fill_in_skill_name_here (kebab-case)
</skill_name>

<skill_description>
fill_in_one_sentence_description_here (third person with trigger phrases)
</skill_description>

## Activation Triggers

<activation_triggers>
- "fill_in_trigger_phrase_1"
- "fill_in_trigger_phrase_2"
- "fill_in_trigger_phrase_3"
</activation_triggers>

## Components to Create

<components>
- [ ] SKILL.md - Main skill definition
- [ ] scripts/ - fill_in_scripts_or_none
- [ ] references/ - fill_in_references_or_none
- [ ] cookbook/ - fill_in_cookbook_files_or_none
- [ ] prompts/ - fill_in_prompts_or_none
</components>

## Workflow Steps

<workflow_steps>
1. fill_in_step_1
2. fill_in_step_2
3. fill_in_step_3
</workflow_steps>

## Variables (if applicable)

<variables>
VARIABLE_NAME: value
ANOTHER_VARIABLE: value
</variables>

## Branching Logic (if applicable)

<branching_logic>
- IF: condition_1
- THEN: action_1
- EXAMPLES:
  - "example phrase 1"
  - "example phrase 2"
</branching_logic>

## Verification

<verification>
- fill_in_verification_command_or_check
- fill_in_expected_output_or_artifact
</verification>

## Constraints & Guardrails

<constraints>
- fill_in_security_considerations
- fill_in_directories_not_to_modify
- fill_in_required_approvals
</constraints>

## Install Location

<install_location>
fill_in_plugin_or_personal_commands
path: fill_in_full_path
</install_location>

---

## Confirmation Prompt

Present to user:

```
I've gathered the following requirements for your skill:

**Name:** <skill_name>
**Description:** <skill_description>
**Location:** <install_location>

**Components:**
<components>

**Workflow:**
<workflow_steps>

Does this look correct? Should I proceed with creating the skill?
```
