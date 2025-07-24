---
description: Reset specific stage to start over
argument-hint: [stage] (requirements|design|plan|build|all)
allowed-tools: Read, Write, Bash, Glob
---

# Reset Stage

You are resetting a specific stage of the spec-driven development workflow. Your task is to safely remove or reset the specified stage while preserving dependencies.

## Input
**Stage to Reset**: $ARGUMENTS (requirements|design|plan|build|all)

## Your Task

1. **Validate the reset request** and identify dependencies
2. **Safely reset the requested stage** while preserving necessary files
3. **Provide clear guidance** on what was reset and next steps

## Reset Logic by Stage

### Reset Requirements (`requirements`)
**Action**: Delete `requirements.md`
**Cascading Effect**: Also removes `design.md` and `tasks.md` (they depend on requirements)
**Reasoning**: Design and implementation plan are invalid without requirements
**Next Step**: Run `/spec [feature-name] [description]` to restart

### Reset Design (`design`)  
**Action**: Delete `design.md`
**Cascading Effect**: Also removes `tasks.md` (implementation plan depends on design)
**Preserves**: `requirements.md` (still valid)
**Reasoning**: Implementation plan is invalid without design
**Next Step**: Run `/design` to regenerate design from requirements

### Reset Plan (`plan`)
**Action**: Delete `tasks.md` or reset task statuses to pending
**Preserves**: `requirements.md` and `design.md` (still valid)
**Reasoning**: Implementation plan can be regenerated from design
**Next Step**: Run `/plan` to regenerate implementation plan

### Reset Build (`build`)
**Action**: Reset all task statuses in `tasks.md` to `[ ]` (pending)
**Preserves**: All specification files
**Reasoning**: Tasks can be re-executed from clean state
**Next Step**: Run `/build` to restart implementation

### Reset All (`all`)
**Action**: Delete entire spec directory
**Effect**: Complete clean slate
**Next Step**: Run `/spec [feature-name] [description]` to restart completely

## Safety Confirmations

Before executing any reset:

```markdown
# ⚠️ Reset Confirmation Required

## Reset Request
**Stage**: [stage name]
**Location**: [spec directory path]

## Impact Assessment
**Will Delete**:
- [file1.md]
- [file2.md]

**Will Preserve**:
- [preserved files]

**Cascading Effects**:
- [dependent stages that will also be reset]

## Confirmation Required
This action cannot be undone. Type "CONFIRM RESET" to proceed.
```

## Reset Execution

### Safe Reset Process
1. **Create backup** of files being deleted (in `.backup/` directory)
2. **Delete specified files** according to reset logic
3. **Update any remaining files** if needed (e.g., task statuses)
4. **Confirm successful reset**

### Post-Reset Report

```markdown
# ✅ Reset Complete

## What Was Reset
- **Stage**: [stage name]
- **Files Removed**: [list of deleted files]
- **Files Preserved**: [list of preserved files]

## Backup Created
- **Location**: `.backup/[timestamp]/`
- **Contents**: [list of backed up files]

## Current Status
- **Active Stage**: [current stage after reset]
- **Next Action**: [specific command to run next]

## Recovery Option
To restore from backup: `cp .backup/[timestamp]/* [spec-directory]/`
```

## Error Conditions

### Invalid Stage Name
```markdown
# ❌ Invalid Stage Name
Valid options: requirements, design, plan, build, all
Example: `/reset design`
```

### No Spec Found
```markdown
# ❌ No Specification Found
No spec files found in current directory.
Use `/spec [feature-name] [description]` to create a new spec.
```

## Success Criteria
- Correct stage is identified and reset
- Dependencies are handled properly (cascading resets)
- Backup is created before deletion
- Clear guidance provided for next steps
- User is informed of exactly what was changed

Execute the requested reset safely while preserving work and providing clear guidance for continuation.