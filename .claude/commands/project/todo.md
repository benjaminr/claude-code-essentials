---
description: Extract and organise TODO comments from codebase
argument-hint: [directory or file path]
allowed-tools: Grep, Read, Write, Glob
---

# Extract TODO Comments

You are extracting and organising TODO, FIXME, HACK, and other development markers from the codebase to help track technical debt and pending tasks.

## Input
**Search Target**: $ARGUMENTS (directory path, file path, or empty for current directory)

## Your Task

Extract and organise development markers:

1. **Search for Markers** - Find TODO, FIXME, HACK, NOTE comments
2. **Categorise Items** - Group by type and priority
3. **Analyze Context** - Understand what needs to be done
4. **Generate Report** - Create actionable task list

## Search Strategy

### Markers to Find
- `TODO:` - Pending tasks
- `FIXME:` - Bugs to fix
- `HACK:` - Temporary solutions
- `NOTE:` - Important notes
- `OPTIMIZE:` - Performance improvements
- `REFACTOR:` - Code improvements
- `DEPRECATED:` - Code to remove
- `@todo` - JSDoc style todos

### Search Pattern
Look for variations:
- `// TODO: description`
- `/* FIXME: description */`
- `# TODO description`
- `<!-- TODO: description -->`
- `@todo description`

## Output Format

```markdown
# 📋 TODO Report

**Generated**: [Date]
**Scope**: [Directory/File searched]
**Total Items**: [Count]

## Summary
- 🔴 Critical (FIXME): [count]
- 🟡 Important (TODO): [count]
- 🔵 Improvements (OPTIMIZE/REFACTOR): [count]
- ⚪ Other (HACK/NOTE): [count]

## By Priority

### 🔴 Critical Issues (FIXME)
1. **[file:line]** - `[component/function]`
   ```
   FIXME: [Description]
   ```
   **Context**: [What this affects]
   **Suggested Action**: [What to do]

### 🟡 Pending Tasks (TODO)
1. **[file:line]** - `[component/function]`
   ```
   TODO: [Description]
   ```
   **Impact**: [Why this matters]
   **Effort**: [Small/Medium/Large]

### 🔵 Improvements
#### Performance (OPTIMIZE)
1. **[file:line]**
   ```
   OPTIMIZE: [Description]
   ```

#### Code Quality (REFACTOR)
1. **[file:line]**
   ```
   REFACTOR: [Description]
   ```

### ⚪ Technical Debt (HACK)
1. **[file:line]**
   ```
   HACK: [Description]
   ```
   **Risk**: [What could break]
   **Proper Solution**: [How to fix properly]

## By File

### [filepath]
- Line [X]: TODO - [Description]
- Line [Y]: FIXME - [Description]

### [another filepath]
- Line [Z]: HACK - [Description]

## Actionable Tasks

### Immediate Actions (Do Now)
- [ ] Fix critical bug in [file:line]
- [ ] Address security issue in [file:line]

### Short Term (This Sprint)
- [ ] Implement [feature] mentioned in [file:line]
- [ ] Refactor [component] as noted in [file:line]

### Long Term (Backlog)
- [ ] Optimize [algorithm] in [file:line]
- [ ] Remove deprecated code in [file:line]

## Patterns Detected

### Common Themes
- [Pattern 1]: Found in [X] files
- [Pattern 2]: Recurring issue

### Technical Debt Hotspots
- `[file/directory]`: [X] items
- `[another location]`: [Y] items

## Recommendations

1. **Address Critical Items First**
   - [Specific FIXME items that need immediate attention]

2. **Group Related TODOs**
   - [TODOs that can be addressed together]

3. **Consider Refactoring**
   - [Areas with multiple HACK/REFACTOR comments]

## Export Options

### Task Management Format
```
- [ ] [CRITICAL] Fix: [Description] ([file:line])
- [ ] [HIGH] Implement: [Description] ([file:line])
- [ ] [MEDIUM] Refactor: [Description] ([file:line])
- [ ] [LOW] Optimize: [Description] ([file:line])
```

### CSV Format
```csv
Type,Priority,Description,File,Line,Added By,Date
FIXME,Critical,"Description",path/to/file.js,42,@username,2024-01-15
```
```

## Analysis Features

### Age Analysis
If git history is available:
- Show how long TODOs have existed
- Identify stale items
- Track who added them

### Complexity Estimation
- Simple: Quick fixes (< 1 hour)
- Medium: Requires design (1-4 hours)
- Complex: Needs planning (> 4 hours)

### Categorisation
- Bug Fixes
- Feature Implementation
- Performance Optimization
- Code Quality
- Documentation
- Testing

## Integration Options

### Generate Tickets
Format for issue tracking:
```markdown
**Title**: [TODO description]
**Type**: [Bug/Feature/Task]
**Priority**: [Critical/High/Medium/Low]
**Description**: [Expanded description]
**Location**: [file:line]
**Context**: [Code snippet]
```

### Update Documentation
Add to project docs:
- Technical debt log
- Known issues list
- Future improvements

## Success Criteria
- All TODO-style comments found
- Items properly categorised
- Context provided for each item
- Actionable tasks generated
- Patterns and hotspots identified

Search for and organise all development markers in the specified location.