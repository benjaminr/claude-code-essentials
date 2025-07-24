---
description: Execute any command in parallel across multiple features using subagents
argument-hint: [command] [feature1,feature2,feature3,...]
allowed-tools: Task, Write, Read, LS, Glob, TodoWrite
---

# Parallel Command Execution

You are orchestrating parallel execution of any slash command across multiple features using subagents. This enables powerful workflows like running complete SDD processes across multiple features simultaneously.

## Memory Integration
- Check project CLAUDE.md for conventions and patterns
- Read any feature-specific CLAUDE.md files in specs/ directories
- Maintain context consistency across parallel executions

## Input
- **Command**: $ARGUMENTS (first argument - the slash command to execute)
- **Features**: $ARGUMENTS (remaining arguments - comma-separated feature list)

## Your Task

### 1. Parse and Validate Input

Parse the command and feature list:
```
/parallel spec user-auth,payment-gateway,notification-system "Multi-feature development"
/parallel build feature-a,feature-b,feature-c
/parallel test auth,payments,notifications
```

**Validation Requirements:**
- Verify the target command exists in .claude/commands/
- Validate feature list format (comma-separated, no spaces)
- Check if features already have specs/ directories
- Ensure no conflicting parallel executions

### 2. Execution Strategy

**For each feature, spawn a subagent with this task structure:**

```markdown
You are executing the command "/{command}" for feature "{feature}".

Context:
- Part of parallel execution across multiple features
- Maintain consistency with project standards
- Report progress and results back to coordinator

Task: Execute /{command} {feature} {additional-args}

Requirements:
- Follow all standard command protocols
- Create/update appropriate directory structure
- Generate all required files
- Maintain project memory consistency
- Handle errors gracefully without blocking other features
```

### 3. Coordination and Progress Tracking

**Create coordination infrastructure:**

```bash
# Create parallel execution tracking
mkdir -p .parallel-runs/$(date +%Y%m%d-%H%M%S)/
```

**Progress Tracking File:**
```markdown
# Parallel Execution: {command}
Started: {timestamp}
Features: {feature-list}

## Progress
- [ ] {feature-1}: {status}
- [ ] {feature-2}: {status}
- [ ] {feature-3}: {status}

## Results
[Will be populated as subagents complete]

## Errors
[Any failures or issues encountered]
```

### 4. Subagent Task Execution

**For each feature, use the Task tool:**

```
Task Description: Execute {command} for {feature}
Task Prompt: 
"You are executing /{command} for feature '{feature}' as part of a parallel execution.

Context:
- This is one of {total-features} features being processed simultaneously  
- Maintain consistency with project CLAUDE.md standards
- Work independently but follow the same quality standards

Your specific task:
1. Execute the /{command} command for feature '{feature}'
2. Follow all standard protocols for this command
3. Handle any feature-specific requirements
4. Report completion status and any issues

Additional arguments: {additional-args}

Complete this task autonomously and report your results."
```

### 5. Result Aggregation and Reporting

**Monitor subagent completion and aggregate results:**

```markdown
# Parallel Execution Results

## Summary
- **Command**: /{command}
- **Features Processed**: {completed}/{total}
- **Success Rate**: {percentage}%
- **Duration**: {elapsed-time}

## Individual Results

### {feature-1} ✅
- Status: Completed successfully
- Files created: [list]
- Notes: [any observations]

### {feature-2} ❌  
- Status: Failed
- Error: [error message]
- Resolution: [suggested fix]

### {feature-3} ⏳
- Status: In progress
- Stage: [current stage]

## Next Steps
[Recommended follow-up actions]

## Quality Check
- [ ] All features follow consistent patterns
- [ ] No naming conflicts or overlaps
- [ ] Documentation standards maintained
- [ ] Project memory updated appropriately
```

## Supported Workflows

### Complete SDD Workflow
```bash
# Generate specs for multiple features
/parallel spec user-auth,payment-api,admin-dashboard

# Design all features
/parallel design user-auth,payment-api,admin-dashboard  

# Create implementation plans
/parallel plan user-auth,payment-api,admin-dashboard

# Build all features
/parallel build user-auth,payment-api,admin-dashboard
```

### Development Tasks
```bash
# Test multiple components
/parallel test auth,payments,notifications

# Debug multiple features
/parallel debug auth,payments,notifications

# Optimise multiple features  
/parallel optimise user-service,payment-service,notification-service

# Clean multiple codebases
/parallel clean frontend/,backend/,mobile/
```

### Quality Assurance
```bash
# Validate multiple specifications
/parallel validate feature-a,feature-b,feature-c

# Review multiple implementations
/parallel review auth-module,payment-module,notification-module

# Security scan multiple features
/parallel security user-auth,admin-panel,api-gateway
```

## Error Handling

### Individual Feature Failures
- Continue processing other features
- Log specific error details
- Provide resolution suggestions
- Allow retry of failed features

### System-Level Issues
- Gracefully terminate all subagents
- Preserve partial results
- Provide recovery instructions
- Clean up coordination files

## Coordination Patterns

### Sequential Dependencies
```bash
# First generate all specs
/parallel spec auth,payments,notifications

# Then design all (after specs complete)  
/parallel design auth,payments,notifications

# Then plan all (after designs complete)
/parallel plan auth,payments,notifications
```

### Batched Execution
```bash
# Process features in smaller batches
/parallel spec batch-1-auth,batch-1-payments
/parallel spec batch-2-notifications,batch-2-admin
```

## Performance Considerations

### Concurrency Management
- Limit concurrent subagents to prevent resource exhaustion
- Queue additional features if limit exceeded
- Monitor system resource usage
- Provide progress indicators

### File System Coordination
- Prevent concurrent writes to shared files
- Use feature-specific directories
- Lock coordination files during updates
- Handle race conditions gracefully

## Success Criteria

1. **All specified features processed** (successfully or with clear error reporting)
2. **Consistent quality** across all parallel executions  
3. **Proper coordination** with progress tracking and result aggregation
4. **Error recovery** options for failed features
5. **Resource management** without system overload
6. **Clear reporting** of results and next steps

Execute the parallel command workflow, spawning subagents for each feature and coordinating their execution to completion.