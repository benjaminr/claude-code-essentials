---
description: Generate structured requirements specification from feature description
argument-hint: [feature-name] [description]
allowed-tools: Write, Read, LS, Glob
---

# Generate Requirements Specification

You are creating the first stage of a spec-driven development workflow. Your task is to transform a feature description into structured requirements using EARS notation (Easy Approach to Requirements Syntax).

## Memory Integration
- Check for project CLAUDE.md for spec conventions and architectural patterns
- Look for requirements templates at @requirements-template.md or @.claude/templates/requirements.md
- Use any imported coding standards and team conventions from memory files

## Input
- **Feature Name**: $ARGUMENTS (first argument)
- **Description**: $ARGUMENTS (remaining arguments)

## Your Task

1. **Check for project memory**: Read any CLAUDE.md files and imported templates
2. **Create directory structure**: Create a `specs/[feature-name]/` directory if it doesn't exist
3. **Create spec-specific memory**: Add a `specs/[feature-name]/CLAUDE.md` file with feature context
4. **Generate requirements.md** with the following structure:

### Requirements File Format

```markdown
# [Feature Name] Requirements

## Overview
[Brief summary of the feature and its purpose]

## User Stories
[List of user stories in standard format: "As a [user], I want [goal] so that [benefit]"]

## Functional Requirements
[Requirements in EARS notation format:]

### [Requirement Category]
**REQ-001**: WHEN [specific condition/trigger occurs] THE SYSTEM SHALL [specific behaviour/response]

**REQ-002**: WHEN [another condition] THE SYSTEM SHALL [another behaviour]

[Continue with additional requirements...]

## Non-Functional Requirements
[Performance, security, usability requirements in EARS format]

## Acceptance Criteria
[Clear, testable criteria that define when the feature is complete]

## Dependencies
[Any dependencies on other systems, features, or external services]

## Assumptions
[Key assumptions made during requirements gathering]
```

## Key Principles
- Use EARS notation (WHEN...THE SYSTEM SHALL...) for all functional requirements
- Make requirements specific, measurable, and testable
- Avoid implementation details - focus on WHAT the system should do, not HOW
- Each requirement should be independently testable
- Use clear, unambiguous language
- Number requirements for traceability

### Spec-Specific Memory File Format

Create `specs/[feature-name]/CLAUDE.md`:
```markdown
# [Feature Name] Specification Context

## Feature Overview
[Brief description of the feature being specified]

## Key Stakeholders
[Who requested this feature and who will use it]

## Business Context
[Why this feature is needed and its priority]

## Technical Constraints
[Any specific technical limitations or requirements]

## Integration Points
[Other systems or features this connects with]

## Success Metrics
[How success will be measured]

## Related Documentation
- Requirements: @requirements.md
- Design: @design.md
- Implementation Plan: @tasks.md
```

## Output Format

```markdown
# Requirements Generation Complete

## Stage Overview
**Stage**: Requirements
**Feature**: [Feature name]
**Status**: ✅ Complete
**Progress**: 100% complete

## Generated Requirements

### Requirements Summary
**Total Requirements**: [X] functional, [Y] non-functional
**User Stories**: [Z] stories defined
**EARS Notation**: ✅ Applied consistently
**Acceptance Criteria**: ✅ Specific and testable

### Files Created
**File**: `specs/[feature-name]/requirements.md`
**Purpose**: EARS-formatted functional and non-functional requirements
**Status**: ✅ Ready

**File**: `specs/[feature-name]/CLAUDE.md`  
**Purpose**: Feature-specific context and constraints
**Status**: ✅ Ready

## Quality Checklist
- ✅ Requirements use proper EARS notation (WHEN...THE SYSTEM SHALL...)
- ✅ Each requirement is atomic and testable
- ✅ User stories follow standard format
- ✅ Acceptance criteria are specific and measurable
- ✅ Feature context documented in CLAUDE.md
- ✅ Project memory and templates referenced

## Next Steps
**Ready to Proceed**: ✅ Yes

Run `/validate` to verify requirements quality, then `/next` to proceed to Design stage.

## Requirements Preview
[Brief preview of key requirements generated]
```

## Success Criteria
- Requirements written in proper EARS notation
- Each requirement atomic and testable
- User stories follow standard format
- Acceptance criteria specific and measurable
- Spec-specific CLAUDE.md provides feature context
- Files saved to correct directory structure

Generate comprehensive, well-structured requirements following EARS notation and project conventions.