---
description: Show progress across all stages of current spec
allowed-tools: Read, Glob
---

# Show Spec Status

You are providing a progress overview of the current spec-driven development workflow. Your task is to show the status across all stages and provide a clear picture of where things stand.

## Your Task

1. **Scan the current directory and subdirectories** for spec files
2. **Identify all active specs** by finding directories containing specification files
3. **Assess the stage and completeness** of each spec
4. **Provide a comprehensive status overview**

## File Detection Logic

Look for these patterns:
- `specs/[feature-name]/requirements.md` - Requirements stage
- `specs/[feature-name]/design.md` - Design stage  
- `specs/[feature-name]/tasks.md` - Implementation planning stage
- Task status in `tasks.md` with indicators like `[✅]`, `[🚧]`, `[ ]` - Build stage

## Status Report Format

```markdown
# 📊 Spec-Driven Development Status

## Active Specs

### [Feature Name 1]
**Location**: `specs/[feature-name]/`
**Current Stage**: [Requirements|Design|Planning|Building|Complete]
**Progress**: [Progress indicator]
**Status**: [Brief status description]
**Next Action**: [What should be done next]

### [Feature Name 2]  
**Location**: `specs/[feature-name]/`
**Current Stage**: [Stage]
**Progress**: [Progress indicator]
**Status**: [Brief status description]
**Next Action**: [Next action]

## Overall Summary
- **Total Specs**: [number]
- **Requirements**: [number] specs
- **Design**: [number] specs  
- **Planning**: [number] specs
- **Building**: [number] specs
- **Complete**: [number] specs

## Recommendations
[Suggestions for next steps across all active specs]
```

## Stage Detection Rules

### Requirements Stage
- `requirements.md` exists
- `design.md` does NOT exist
- **Progress**: ◐ In Progress
- **Next Action**: Run `/validate` then `/next`

### Design Stage  
- `requirements.md` exists
- `design.md` exists
- `tasks.md` does NOT exist
- **Progress**: ◐ In Progress
- **Next Action**: Run `/validate` then `/next`

### Planning Stage
- All three files exist (`requirements.md`, `design.md`, `tasks.md`)
- No tasks marked as in-progress or completed
- **Progress**: ◐ In Progress  
- **Next Action**: Run `/validate` then `/build`

### Building Stage
- All files exist
- Some tasks marked with `[🚧]` (in-progress) or `[✅]` (completed)
- **Progress**: [X/Y] tasks completed
- **Next Action**: Continue with `/build`

### Complete Stage
- All files exist
- All tasks marked as `[✅]` (completed)
- **Progress**: ✅ Complete
- **Next Action**: Ready for deployment/review

## Progress Indicators
- ○ Not Started
- ◐ In Progress  
- ● Complete
- ❌ Blocked/Error
- ⚠️ Needs Attention

## Success Criteria
- All spec directories are identified
- Current stage is accurately determined
- Progress is clearly indicated
- Next actions are specific and helpful
- Overall summary provides useful insights

Scan for all specification files and provide a comprehensive status overview of the spec-driven development workflow.