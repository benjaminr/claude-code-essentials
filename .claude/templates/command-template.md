# Command Development Standards

This document defines the standardised structure and patterns for all slash commands in our development toolkit.

## 📝 Command File Structure Template

```markdown
---
description: [Clear, concise one-line description]
argument-hint: [parameter format or examples]
allowed-tools: [List of Claude tools this command can use]
---

# [Command Name]

[Brief explanation of what this command does and its purpose in the workflow]

## Input
**[Input Type]**: $ARGUMENTS ([description of expected input])

## Your Task

[Clear task definition with numbered objectives]:

1. **[Primary Function]** - [What the main action accomplishes]
2. **[Secondary Function]** - [Supporting actions]
3. **[Output Function]** - [How results are presented]
4. **[Validation Function]** - [Quality checks performed]

## [Command-Specific Framework/Strategy]

### 1. [Analysis/Assessment Phase]
[Description of initial analysis steps]

### 2. [Processing Phase]
[Description of main processing logic]

### 3. [Output Phase]
[Description of result formatting and presentation]

## Output Format

```markdown
# [Command] Report

## Executive Summary
**[Key Metric]**: [Value]
**Status**: [✅ Success | ⚠️ Warning | ❌ Error]
**[Context Metric]**: [Additional key information]

## [Main Content Section]
### [Subsection Title]
[Content structure with functional status indicators where needed]

### [Another Subsection]
[Content structure]

## Issues Found
### 🔴 Critical Issues
- ❌ **[Issue Type]**: [Specific issue description]

### 🟡 Important Issues  
- ⚠️ **[Issue Type]**: [Specific issue description]

### 🟢 Minor Issues
- [Issue description without status emoji for minor items]

## Action Plan
### Immediate Actions (Required)
- [ ] [Action item 1]
- [ ] [Action item 2]

### Recommended Improvements
- [ ] [Long-term recommendation 1]
- [ ] [Long-term recommendation 2]

## Next Steps
[Clear guidance on what to do next]
```

## Success Criteria
- [Criterion 1: Functional requirement]
- [Criterion 2: Quality requirement]
- [Criterion 3: Output requirement]

[Final instruction that ties back to the command's purpose]
```

## 🎨 Standardised Output Templates

### Analysis/Report Commands (debug, security, optimize, dependencies)
```markdown
# [🔍📊⚡🔒] [Command] Analysis Report

## Executive Summary
**Scope**: [What was analysed]
**Issues Found**: [X] critical, [Y] major, [Z] minor
**Overall Status**: [🔴 Critical | 🟡 Attention Needed | 🟢 Good]
**Confidence**: [High/Medium/Low]

## 🔴 Critical Issues
[Priority-ordered list of critical findings]

## 🟡 Major Findings
[Important but non-critical findings]

## 🟢 Positive Observations
[What's working well]

## 📋 Action Plan
### Immediate (Do Now)
- [ ] [Critical fix 1]
- [ ] [Critical fix 2]

### Short Term (This Week)
- [ ] [Important improvement 1]
- [ ] [Important improvement 2]

### Long Term (Next Sprint)
- [ ] [Strategic improvement 1]
- [ ] [Strategic improvement 2]

## 📊 Metrics & Context
[Relevant measurements, benchmarks, or contextual data]
```

### Generation Commands (test, document, api)
```markdown
# [🧪📚🔌] [Command] Generation Complete

## Generation Summary
**Target**: [What was generated for]
**Files Created**: [X] files, [Y] lines of code
**Coverage**: [Scope of generation]
**Framework**: [Technology/pattern used]

## Generated Components

### [Component Type 1]
**File**: `[path/to/file]`
**Purpose**: [What this component does]

```[language]
[Code preview or key examples]
```

### [Component Type 2]
**File**: `[path/to/file]`
**Purpose**: [What this component does]

## Quality Assurance
✅ **Validated**: [What was checked]
✅ **Tested**: [What was verified]
✅ **Documented**: [What was documented]

## Next Steps
1. [First recommended action]
2. [Second recommended action]
3. [Third recommended action]

## Usage Examples
[How to use what was generated]
```

### Process Commands (clean, migrate, refactor)
```markdown
# [🧹🔄🔧] [Command] Process Complete

## Process Summary
**Operation**: [What process was performed]
**Scope**: [Files/components affected]
**Changes**: [High-level summary of changes]
**Duration**: [Time taken or estimated time]

## Changes Made

### [Change Category 1]
**Impact**: [Description of impact]
**Files**: [X] files modified

#### Before:
```[language]
[Example of before state]
```

#### After:
```[language]
[Example of after state]
```

**Benefit**: [Why this change improves things]

## Validation Results
✅ **Tests**: [Test status]
✅ **Linting**: [Lint status]  
✅ **Build**: [Build status]
✅ **Functionality**: [Function status]

## Impact Assessment
- **Performance**: [Impact on performance]
- **Maintainability**: [Impact on code maintainability]
- **Security**: [Security implications]

## Recommendations
[Follow-up actions or related improvements]
```

### Workflow Commands (SDD: spec, design, plan, build, validate, etc.)
```markdown
# [📋🏗️📝🔨✅] [Stage] [Status]

## Stage Overview  
**Stage**: [Requirements/Design/Planning/Implementation]
**Feature**: [Feature name]
**Status**: [In Progress/Complete/Needs Review]
**Progress**: [X]% complete

## [Stage-Specific Content Section]
[Content relevant to the specific workflow stage]

## Quality Checklist
- [✅❌] [Quality criterion 1]
- [✅❌] [Quality criterion 2] 
- [✅❌] [Quality criterion 3]

## Next Steps
**Ready to Proceed**: [✅ Yes | ❌ No - requires fixes]

### If Ready:
Run `/next` to proceed to [next stage]

### If Not Ready:
1. [Required fix 1]
2. [Required fix 2]
Then run `/validate` again

## Files Generated/Modified
- `[path/file1]` - [Purpose]
- `[path/file2]` - [Purpose]
```

## 🎯 Consistent Patterns

### Status Indicators
- ✅ **Success/Complete**
- ⚠️ **Warning/Needs Attention** 
- ❌ **Error/Critical Issue**
- 🔴 **High Priority**
- 🟡 **Medium Priority**  
- 🟢 **Low Priority/Good**
- 🚧 **In Progress**

### Action Items Format
```markdown
### [Priority Level] ([Timeframe])
- [ ] [Specific actionable item]
- [ ] [Another specific item]
```

### Code Examples Format
```markdown
#### [Context Description]:
```[language]
[Code example with clear context]
```

**Explanation**: [Why this code/approach]
```

### File References Format
```markdown
**File**: `path/to/file.ext:line`
**Purpose**: [What this file does]
**Status**: [✅ Ready | 🚧 Modified | ❌ Issue]
```

## 🔄 Error Handling Standards

### Validation Patterns
```markdown
## Validation Results
**Overall**: [✅ Pass | ❌ Fail] 

### Requirements Met
- [✅❌] [Specific requirement]
- [✅❌] [Another requirement]

### Issues Found
[If validation fails, specific issues with remediation steps]
```

### Error Response Format  
```markdown
# ❌ [Command] Error

## Error Summary
**Issue**: [Brief description]
**Cause**: [Root cause analysis]
**Impact**: [What this affects]

## Resolution Steps
1. [Step to resolve]
2. [Another step]
3. [Final verification step]

## Prevention
[How to avoid this error in future]
```

This standardised approach ensures:
- **Consistent User Experience**: Users know what to expect
- **Predictable Output Format**: Easy to parse and understand
- **Actionable Results**: Clear next steps always provided
- **Quality Indicators**: Consistent status and progress reporting
- **Professional Presentation**: Clean, organised, scannable output