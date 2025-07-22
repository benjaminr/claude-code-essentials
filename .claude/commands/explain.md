---
description: Explain how code works in detail
argument-hint: [file path, function name, or code snippet]
allowed-tools: Read, Grep, Glob, Task
---

# Explain Code

You are explaining code to help developers understand how it works, its purpose, and its interactions with other parts of the system.

## Input
**Code to Explain**: $ARGUMENTS (file path, function name, or description)

## Your Task

Provide a comprehensive explanation that helps developers understand:

1. **What the code does** - High-level purpose and functionality
2. **How it works** - Step-by-step breakdown of logic
3. **Why it's designed this way** - Architectural decisions and patterns
4. **How to use it** - Examples and best practices

## Explanation Approach

### 1. Code Analysis
- **Locate the Code**: Find and read the relevant code
- **Understand Context**: Check imports, exports, and dependencies
- **Identify Patterns**: Recognize design patterns and conventions
- **Trace Data Flow**: Follow how data moves through the code

### 2. Explanation Structure

```markdown
# 📖 Code Explanation

## Overview
**Purpose**: [What problem this code solves]
**Location**: `[file:line]`
**Type**: [Function/Class/Module/Component]

## How It Works

### High-Level Flow
[Visual or textual flow diagram showing main steps]

### Detailed Breakdown
1. **[Step/Section 1]**
   - What happens: [Explanation]
   - Why: [Reasoning]
   - Code snippet:
   ```[language]
   [Relevant code]
   ```

2. **[Step/Section 2]**
   - What happens: [Explanation]
   - Key logic: [Important details]

### Key Concepts
- **[Concept 1]**: [Explanation of important concept]
- **[Concept 2]**: [Another key concept]

## Dependencies & Interactions

### Imports/Uses
- `[Module]` - [Why it's needed]
- `[Function]` - [How it's used]

### Called By
- `[Function/Component]` - [Context of use]

### Side Effects
- [Any external changes or mutations]
- [API calls, file operations, etc.]

## Usage Examples

### Basic Usage
```[language]
// Example of how to use this code
[Usage example]
```

### Advanced Usage
```[language]
// More complex example
[Advanced example]
```

## Important Notes
⚠️ **Gotchas**: [Common mistakes or edge cases]
💡 **Best Practices**: [Recommended usage patterns]
🔧 **Configuration**: [Any config options]

## Related Code
- `[Related file:function]` - [How it relates]
- `[Another file]` - [Connection]
```

## Explanation Types

### Function/Method Explanation
- Parameters and types
- Return values
- Algorithm walkthrough
- Complexity analysis
- Error handling

### Class/Component Explanation
- Purpose and responsibilities
- Public interface
- Internal state
- Lifecycle methods
- Inheritance/composition

### Module/Package Explanation
- Public API
- Internal structure
- Design decisions
- Integration points

### Algorithm Explanation
- Time/space complexity
- Step-by-step process
- Visual representations
- Trade-offs

### Architecture Explanation
- System design
- Component relationships
- Data flow
- Design patterns used

## Visual Aids

When helpful, include:
- Flow diagrams
- Sequence diagrams
- State machines
- Data structure visualizations

Example:
```
Input → [Process A] → [Process B] → Output
           ↓              ↑
        [Cache]      [Validation]
```

## Complexity Levels

Adjust explanation based on context:

### Beginner-Friendly
- Avoid jargon
- Explain prerequisites
- Use analogies
- Provide more examples

### Technical Deep-Dive
- Include implementation details
- Discuss performance implications
- Cover edge cases
- Reference specifications

## Success Criteria
- Explanation is clear and accurate
- Examples are runnable and relevant
- Complex concepts are broken down
- Relationships to other code are clear
- Developer can confidently use/modify the code

Provide a thorough explanation of the specified code to enhance understanding.