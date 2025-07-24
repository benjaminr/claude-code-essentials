---
description: Explain code, architecture patterns, and data flows in detail
argument-hint: [file path, function name, "overview", or pattern name]
allowed-tools: Read, Grep, Glob, Task, LS
---

# Explain Code

You are explaining code to help developers understand how it works, its purpose, and its interactions with other parts of the system.

## Input
**Explanation Request**: $ARGUMENTS
- **File/Function**: Specific code to explain (e.g., `auth.py`, `processPayment`)
- **"overview"**: Generate project architecture overview
- **Pattern**: Architectural pattern to identify (e.g., "MVC", "event-driven")
- **Data Flow**: Trace data through system (e.g., "user registration flow")

## Your Task

Provide a comprehensive explanation based on the request type:

### For Specific Code:
1. **What the code does** - High-level purpose and functionality
2. **How it works** - Step-by-step breakdown of logic
3. **Why it's designed this way** - Architectural decisions and patterns
4. **How to use it** - Examples and best practices

### For Architecture Overview:
1. **Project Structure** - Directory organisation and purpose
2. **Key Components** - Major modules and their responsibilities
3. **Architecture Patterns** - Design patterns and principles used
4. **Data Flow** - How information moves through the system
5. **Integration Points** - External services and APIs

### For Pattern Analysis:
1. **Pattern Identification** - Recognise architectural patterns
2. **Implementation Details** - How patterns are applied
3. **Benefits & Trade-offs** - Why these patterns were chosen
4. **Recommendations** - Improvements or alternatives

## Explanation Approach

### 1. Code Analysis
- **Locate the Code**: Find and read the relevant code
- **Understand Context**: Check imports, exports, and dependencies
- **Identify Patterns**: Recognise design patterns and conventions
- **Trace Data Flow**: Follow how data moves through the code

### 2. Architecture Overview (when requested)
- **Scan Project Structure**: Use LS and Glob to map directories
- **Identify Entry Points**: Find main files and initialisation code
- **Map Component Relationships**: Trace dependencies between modules
- **Detect Patterns**: Identify MVC, microservices, layered architecture, etc.
- **Visualise Structure**: Create ASCII diagrams of architecture

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

### Project Overview Explanation
When "overview" is requested:
```markdown
# 🏗️ Project Architecture Overview

## Project Structure
```
.
├── src/              # Main application code
│   ├── api/         # API endpoints
│   ├── models/      # Data models
│   ├── services/    # Business logic
│   └── utils/       # Shared utilities
├── tests/           # Test suites
└── config/          # Configuration files
```

## Architecture Pattern
**Type**: [Layered/Microservices/MVC/Event-Driven]
**Key Principles**: 
- [Principle 1]
- [Principle 2]

## Core Components

### 1. API Layer
- **Purpose**: [Description]
- **Key Files**: [List]
- **Technologies**: [List]

### 2. Business Logic Layer
- **Purpose**: [Description]
- **Patterns**: [Service pattern, Repository pattern, etc.]

### 3. Data Layer
- **Database**: [Type and purpose]
- **ORM/ODM**: [If applicable]
- **Caching**: [Strategy]

## Data Flow Example
```
User Request → API Gateway → Auth Middleware → Controller
                                                    ↓
Response ← Serializer ← Service Layer ← Database/Cache
```

## Key Design Decisions
1. **[Decision 1]**: [Rationale]
2. **[Decision 2]**: [Rationale]

## Integration Points
- **External APIs**: [List with purposes]
- **Message Queues**: [If applicable]
- **Third-party Services**: [List]
```

## Visual Aids

When helpful, include:
- Flow diagrams
- Sequence diagrams  
- State machines
- Data structure visualisations
- Architecture diagrams

Example:
```
Input → [Process A] → [Process B] → Output
           ↓              ↑
        [Cache]      [Validation]
```

### Architecture Diagram Example
```
┌─────────────────────────────────────────────────┐
│                  Frontend (React)                │
└─────────────────┬───────────────────────────────┘
                  │ REST API
┌─────────────────▼───────────────────────────────┐
│             API Gateway (Express)                │
├─────────────────┬───────────────────────────────┤
│   Auth Service  │  Business Logic   │  Logger   │
├─────────────────┼───────────────────┴───────────┤
│                 │     Data Access Layer          │
├─────────────────┼───────────────────────────────┤
│   PostgreSQL    │    Redis Cache    │   S3      │
└─────────────────┴───────────────────────────────┘
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