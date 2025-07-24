---
description: Execute implementation plan and build the feature
allowed-tools: Read, Write, Edit, MultiEdit, Bash, Glob, Grep, Task
---

# Execute Implementation Plan

You are in the fourth stage of a spec-driven development workflow. Your task is to execute the implementation plan and build the feature according to specifications.

## Prerequisites
- A `requirements.md` file must exist in the current spec directory
- A `design.md` file must exist in the current spec directory  
- A `tasks.md` file must exist in the current spec directory
- All previous stages should be reviewed and validated

## Your Task

1. **Read all specification files** (requirements.md, design.md, tasks.md) from the current spec directory
2. **Execute the implementation plan** by working through tasks systematically
3. **Update task status** in tasks.md as you progress

## Implementation Process

### Step 1: Environment Assessment
- Examine the existing codebase structure
- Identify relevant files, frameworks, and patterns
- Check for existing similar implementations to follow conventions

### Step 2: Task Execution
For each task in the implementation plan:
1. **Mark task as in-progress** by changing `[ ]` to `[🚧]` in tasks.md
2. **Implement the task** following the requirements and design
3. **Verify the implementation** meets the specified outcome
4. **Mark task as complete** by changing `[🚧]` to `[✅]` in tasks.md
5. **Update task with any notes** about implementation decisions

### Step 3: Integration & Testing
- Run any existing test suites to ensure no regressions
- Create tests for new functionality as specified in tasks
- Verify all requirements are met

### Step 4: Documentation Updates
- Update relevant documentation files
- Add code comments where necessary
- Update API documentation if applicable

## Task Status Indicators
- `[ ]` - Pending
- `[🚧]` - In Progress  
- `[✅]` - Completed
- `[❌]` - Blocked/Failed
- `[⏭️]` - Skipped (with reason)

## Implementation Guidelines

### Code Quality
- Follow existing code style and conventions
- Write clean, readable, maintainable code
- Include appropriate error handling
- Add meaningful comments for complex logic

### Testing
- Write unit tests for new functions/methods
- Add integration tests for API endpoints
- Ensure tests cover edge cases and error conditions
- Maintain or improve existing test coverage

### Security
- Validate all inputs
- Use proper authentication/authorisation
- Avoid hardcoding secrets or sensitive data
- Follow secure coding practices

### Performance
- Consider performance implications of implementation choices
- Optimise database queries
- Implement caching where appropriate
- Monitor resource usage

## Progress Tracking
Throughout implementation:
1. Keep tasks.md updated with current status
2. Note any deviations from the original plan
3. Document any architectural decisions made during implementation
4. Update design.md if significant changes are needed

## Success Criteria
- All tasks in tasks.md are marked as completed
- Implementation satisfies all requirements from requirements.md
- Code follows the architecture outlined in design.md
- All tests pass
- Documentation is updated
- No regressions introduced

## When to Stop
Complete the build phase when:
- All planned tasks are finished
- Requirements are fully implemented
- Tests are passing
- Code is ready for review/deployment

Start by reading all specification files, then systematically work through the implementation plan, updating task status as you progress.