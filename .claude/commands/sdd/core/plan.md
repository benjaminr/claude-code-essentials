---
description: Generate implementation plan from technical design
allowed-tools: Read, Write, Glob
---

# Generate Implementation Plan

You are creating the third stage of a spec-driven development workflow. Your task is to create a detailed implementation plan based on the existing technical design.

## Memory Integration  
- Read project CLAUDE.md for development workflows and task templates
- Check for task templates at @tasks-template.md or @.claude/templates/tasks.md
- Use imported coding standards, testing approaches, and deployment practices
- Reference team conventions for task sizing and effort estimation

## Prerequisites
- A `requirements.md` file must exist in the current spec directory
- A `design.md` file must exist in the current spec directory
- A `CLAUDE.md` file should exist in the spec directory for feature context
- Both specification files should be reviewed and validated before proceeding

## Your Task

1. **Read project and spec memory**: Check CLAUDE.md files for development conventions
2. **Read the existing requirements.md and design.md files** from the current spec directory  
3. **Read spec-specific CLAUDE.md** for implementation constraints and context
4. **Generate tasks.md** with the following structure:

### Implementation Plan File Format

```markdown
# [Feature Name] Implementation Plan

## Project Overview
[Brief summary linking requirements to technical approach]

## Development Phases

### Phase 1: Foundation
**Tasks:**
- [ ] **TASK-001**: Set up project structure and dependencies
  - **Description**: [Detailed description of what needs to be done]
  - **Outcome**: [What success looks like]
  - **Dependencies**: [Any prerequisites]
  - **Estimated Effort**: [Small/Medium/Large or hours]

- [ ] **TASK-002**: Configure development environment
  - **Description**: [Detailed description]
  - **Outcome**: [Success criteria]
  - **Dependencies**: [Prerequisites]
  - **Estimated Effort**: [Estimate]

### Phase 2: Core Implementation
**Tasks:**
- [ ] **TASK-003**: Implement [specific component]
  - **Description**: [What to build and how]
  - **Outcome**: [Acceptance criteria]
  - **Dependencies**: [Previous tasks]
  - **Estimated Effort**: [Estimate]

### Phase 3: Integration & Testing
**Tasks:**
- [ ] **TASK-004**: Write unit tests for [component]
  - **Description**: [Testing approach]
  - **Outcome**: [Coverage and quality goals]
  - **Dependencies**: [Implementation tasks]
  - **Estimated Effort**: [Estimate]

### Phase 4: Documentation & Deployment
**Tasks:**
- [ ] **TASK-005**: Create deployment configuration
  - **Description**: [Deployment requirements]
  - **Outcome**: [Deployment success criteria]
  - **Dependencies**: [Previous phases]
  - **Estimated Effort**: [Estimate]

## Risk Assessment
### High Risk
- [Risk description and mitigation strategy]

### Medium Risk
- [Risk description and mitigation strategy]

## Definition of Done
- [ ] All requirements from requirements.md are implemented
- [ ] Code follows project standards and passes linting
- [ ] Unit tests achieve [X]% coverage
- [ ] Integration tests pass
- [ ] Documentation is complete and up-to-date
- [ ] Security review completed
- [ ] Performance requirements met

## Dependencies
### Internal
- [Dependencies on other features/components]

### External
- [Third-party services, APIs, libraries]

## Deployment Checklist
- [ ] Environment configuration verified
- [ ] Database migrations prepared
- [ ] Monitoring and alerting configured
- [ ] Rollback plan documented
- [ ] Performance benchmarks established
```

## Key Principles
- Break work into discrete, actionable tasks
- Each task should be completable in 1-2 days maximum
- Tasks should have clear success criteria
- Include testing and documentation tasks
- Consider dependencies between tasks
- Estimate effort realistically
- Include risk assessment and mitigation
- Tasks should map directly to design components

## Task Sizing Guidelines
- **Small**: 2-4 hours, single component/function
- **Medium**: 1-2 days, multiple related components
- **Large**: 2-5 days, complex feature or integration

## Success Criteria
- All design components have corresponding implementation tasks
- Tasks are properly sequenced with clear dependencies
- Each task has specific outcomes and acceptance criteria
- Testing strategy is comprehensive
- Risk assessment identifies potential blockers
- File is saved to current spec directory as `tasks.md`

Start by reading both the requirements.md and design.md files, then create a comprehensive implementation plan that delivers the designed solution.