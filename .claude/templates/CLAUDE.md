# Project Memory - Spec-Driven Development

## Spec-Driven Development Workflow

This project follows a 4-stage spec-driven development process:

1. **Requirements** (`/spec`) - Generate structured requirements using EARS notation
2. **Design** (`/design`) - Create technical architecture and system design  
3. **Planning** (`/plan`) - Break down work into discrete, trackable tasks
4. **Build** (`/build`) - Execute implementation according to specifications

### Available Commands
- `/spec [feature-name] [description]` - Create requirements specification
- `/design` - Generate technical design from requirements
- `/plan` - Create implementation plan from design
- `/build` - Execute implementation tasks
- `/validate` - Check current stage quality and completeness
- `/next` - Progress to next stage with validation
- `/status` - Show progress across all active specs
- `/refine [instructions]` - Improve current stage
- `/reset [stage]` - Reset specific stage
- `/spec-all [feature-name] [description]` - Complete workflow automatically

## Project Conventions

### Requirements Standards
- Use EARS notation: "WHEN [condition] THE SYSTEM SHALL [behavior]"
- Number requirements for traceability (REQ-001, REQ-002, etc.)
- Include user stories in format: "As a [user], I want [goal] so that [benefit]"
- Make acceptance criteria specific and testable

### Design Principles
- Follow existing system architecture patterns
- Document all major components and their interactions
- Include security and performance considerations
- Design APIs following REST principles where applicable

### Implementation Practices
- Break tasks into 1-2 day chunks maximum
- Include comprehensive testing strategy
- Follow established coding standards
- Document architectural decisions

### File Organization
```
specs/
  [feature-name]/
    CLAUDE.md          # Feature-specific context
    requirements.md    # EARS-formatted requirements
    design.md         # Technical architecture
    tasks.md          # Implementation plan
```

## Team Standards

### Code Style
- [Add your team's coding standards here]
- [Linting rules, formatting preferences]
- [Naming conventions]

### Testing Approach
- [Unit testing requirements]
- [Integration testing strategy]  
- [Code coverage expectations]

### Deployment Process
- [Build and deployment commands]
- [Environment setup]
- [Release procedures]

## Technology Stack

### Core Technologies
- [List primary languages, frameworks]
- [Database technologies]
- [Infrastructure tools]

### Development Tools
- [Build tools and commands]
- [Testing frameworks]
- [Linting and formatting tools]

## Common Commands

### Build & Test
```bash
# [Add your common build commands]
# npm run build
# npm test
# npm run lint
```

### Development
```bash
# [Add your dev server commands]
# npm run dev
# npm run watch
```

## External Documentation

### Architecture
- [Link to system architecture docs]
- [Database schema documentation]
- [API documentation]

### Process
- [Link to team workflow documentation]
- [Code review guidelines]  
- [Release process documentation]

---

## Spec-Driven Development Tips

1. **Start with `/spec-all`** for rapid prototyping, then refine individual stages
2. **Use `/validate`** frequently to catch issues early
3. **Keep CLAUDE.md files updated** in each spec directory for context
4. **Run `/status`** to track progress across multiple features
5. **Leverage memory imports** - reference `@common-patterns.md` or `@api-standards.md`