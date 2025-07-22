---
description: Generate technical design from requirements specification
allowed-tools: Read, Write, Glob
---

# Generate Technical Design

You are creating the second stage of a spec-driven development workflow. Your task is to create a comprehensive technical design based on the existing requirements specification.

## Memory Integration
- Read project CLAUDE.md for architectural patterns and design standards
- Check for design templates at @design-template.md or @.claude/templates/design.md  
- Use any imported technology preferences and coding conventions
- Reference existing system architecture documentation from memory imports

## Prerequisites
- A `requirements.md` file must exist in the current spec directory
- A `CLAUDE.md` file should exist in the spec directory for feature context
- Requirements should be reviewed and validated before proceeding

## Your Task

1. **Read project and spec memory**: Check CLAUDE.md files for context and conventions
2. **Read the existing requirements.md file** from the current spec directory
3. **Read spec-specific CLAUDE.md** for feature context and constraints
4. **Generate design.md** with the following structure:

### Design File Format

```markdown
# [Feature Name] Technical Design

## Architecture Overview
[High-level system architecture and component relationships]

## System Components
### [Component Name]
- **Purpose**: [What this component does]
- **Responsibilities**: [Key responsibilities]
- **Interfaces**: [How it connects to other components]

## Data Flow
[Description of how data moves through the system]
```mermaid
graph TD
    [Component A] --> [Component B]
    [Component B] --> [Component C]
```

## API Design
### Endpoints
- **[HTTP Method] /api/[endpoint]**
  - Purpose: [What this endpoint does]
  - Request: [Request format/schema]
  - Response: [Response format/schema]
  - Status Codes: [Expected status codes]

## Data Models
### [Model Name]
```
{
  "field1": "type",
  "field2": "type",
  "field3": {
    "nestedField": "type"
  }
}
```

## Database Design
[Database schema, relationships, indexes]

## Security Considerations
[Authentication, authorization, data protection measures]

## Error Handling Strategy
[How errors are caught, logged, and communicated]

## Performance Considerations
[Caching, optimization, scalability concerns]

## Integration Points
[External systems, APIs, third-party services]

## Configuration
[Environment variables, configuration files, feature flags]

## Monitoring & Logging
[What to log, metrics to track, alerting strategy]
```

## Key Principles
- Design should directly address all requirements from requirements.md
- Focus on technical architecture, not implementation details
- Include sequence diagrams where helpful for complex interactions
- Consider scalability, maintainability, and security
- Design should be technology-agnostic where possible
- All major components should be documented
- Include error handling and edge cases

## Output Format

```markdown
# Design Generation Complete

## Stage Overview
**Stage**: Design
**Feature**: [Feature name]
**Status**: ✅ Complete
**Progress**: 100% complete

## Generated Design

### Architecture Summary
**Components**: [X] major components designed
**APIs**: [Y] endpoints specified
**Data Models**: [Z] models defined
**Integration Points**: [W] external systems

### Files Created
**File**: `specs/[feature-name]/design.md`
**Purpose**: Technical architecture and system design
**Status**: ✅ Ready

## Quality Checklist
- ✅ Design addresses all functional requirements
- ✅ Architecture is clear and well-documented
- ✅ Data flow is logical and efficient
- ✅ API design follows REST principles
- ✅ Security considerations addressed
- ✅ Performance considerations included

## Requirements Coverage
- ✅ **REQ-001**: [How requirement is addressed in design]
- ✅ **REQ-002**: [How requirement is addressed in design]
- ✅ **REQ-003**: [How requirement is addressed in design]

## Next Steps
**Ready to Proceed**: ✅ Yes

Run `/validate` to verify design quality, then `/next` to proceed to Planning stage.

## Design Preview
### Key Components
- **[Component 1]**: [Brief description]
- **[Component 2]**: [Brief description]

### Architecture Highlights
[Key architectural decisions and patterns used]
```

## Success Criteria
- Design addresses all functional requirements
- Architecture clear and well-documented
- Data flow logical and efficient
- API design follows REST principles
- Security considerations addressed
- Requirements traceability maintained

Create comprehensive technical design that fulfills all specified requirements with clear architecture and implementation guidance.