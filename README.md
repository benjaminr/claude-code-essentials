# Claude Code Essentials

A collection of Claude Code slash commands for systematic development workflows.

## What This Gives You

27 slash commands for feature development:
- **Requirements → Design → Planning → Implementation** workflow
- **EARS notation** for clear, testable requirements  
- **Built-in validation** at each stage
- **Memory integration** for project context

## Quick Install (Global Setup)

```bash
curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash
```

This installs commands to your `~/.claude` directory, making them available across all projects.

## Quick Start

```bash
# Initialize in any project
/init-sdd

# Create your first spec
/spec user-auth "Secure authentication with 2FA"

# Follow the workflow
/next    # Generate design
/next    # Create implementation plan  
/build   # Start coding with guided tasks
```

## Core Workflow

### The 4-Stage Process

```
Requirements → Design → Planning → Implementation
     ↓           ↓         ↓           ↓
   /spec     /design    /plan      /build
```

**Manual Control:**
- `/spec [name] [description]` - Generate EARS requirements
- `/next` - Progress to next validated stage
- `/build` - Execute implementation with task tracking

**Automatic Mode:**
- `/spec-all [name] [description]` - Generate complete specification

### Quality Control

- `/validate` - Check current stage completeness
- `/status` - Overview of all specifications  
- `/refine [instructions]` - Improve current stage
- `/reset [stage]` - Reset with backup

## Additional Commands

**Development:**
- `/debug [error]` - Error analysis and solutions
- `/test [target]` - Generate comprehensive test suites
- `/optimize [code]` - Performance analysis
- `/clean [path]` - Code cleanup and formatting
- `/parallel [command] [feature1,feature2,...]` - Execute any command across multiple features

**Rapid Prototyping:**
- `/prototype [idea] [mvp|full] [tech-stack]` - Build complete prototypes from high-level ideas

**Project Management:**
- `/dependencies` - Analyse and manage dependencies
- `/setup` - Configure development environment
- `/todo [path]` - Extract and organise TODOs

## Key Features

### EARS Requirements Format
```
WHEN user submits login form with valid credentials
THE SYSTEM SHALL authenticate user and redirect to dashboard

WHEN authentication fails after 3 attempts  
THE SYSTEM SHALL lock account for 15 minutes
```

### Memory-Driven Context
Each specification gets its own `CLAUDE.md` with:
- Feature-specific context
- Design decisions
- Implementation notes
- Testing requirements

### Progressive Validation
- Each stage validated before progression
- Quality gates prevent rushing
- Automatic backups when resetting

## File Structure After Installation

```
~/.claude/
├── commands/              # 27 slash commands
│   ├── spec.md           # Requirements generation
│   ├── design.md         # Technical design  
│   ├── plan.md           # Implementation planning
│   ├── build.md          # Guided implementation
│   ├── prototype.md      # Complete prototype builder
│   ├── parallel.md       # Multi-feature execution
│   ├── debug.md          # Error analysis
│   ├── test.md           # Test generation
│   └── ...               # 19 more commands
└── templates/
    └── command-template.md

# In each project:
specs/[feature-name]/
├── CLAUDE.md            # Feature context
├── requirements.md      # EARS requirements
├── design.md           # Technical architecture  
└── tasks.md            # Implementation plan
```

## Development Standards

Includes `CLAUDE.md` with:
- **Modern Python** best practices (built-in generics, UV package manager)
- **Pre-commit** configuration with linting and security tools
- **Code quality** standards and patterns
- **British English** requirement
- **Multi-language** examples (Python + JavaScript)

## Example Workflow

### Single Feature Development
```bash
# Start a new feature
/spec payment-system "Process payments securely with Stripe"

# Review generated requirements, then proceed
/next  # Creates technical design

# Review architecture, then proceed  
/next  # Creates implementation tasks

# Start building with guided task tracking
/build

# Throughout development
/validate  # Check quality
/test api/payments.py  # Generate tests
/debug "Payment webhook failing"  # Debug issues
```

### Parallel Multi-Feature Development
```bash
# Generate specs for multiple features simultaneously
/parallel spec user-auth,payment-api,admin-dashboard

# Design all features in parallel
/parallel design user-auth,payment-api,admin-dashboard  

# Create implementation plans for all
/parallel plan user-auth,payment-api,admin-dashboard

# Build all features with coordinated task tracking
/parallel build user-auth,payment-api,admin-dashboard

# Quality assurance across all features
/parallel validate user-auth,payment-api,admin-dashboard
/parallel test auth-service,payment-service,admin-service
```

### Rapid Prototype Development
```bash
# Build complete MVP from high-level idea
/prototype "user facing coffee app" mvp "React + Node.js"

# Generate full e-commerce platform  
/prototype "online marketplace for handmade goods" full

# Create social networking prototype
/prototype "local community events app" mvp "mobile-first"

# Build productivity tool
/prototype "team collaboration workspace" mvp "TypeScript + PostgreSQL"
```

## Requirements

- **Claude Code** CLI installed
- **Git** (for project tracking)
- **Python 3.9+** or **Node.js 18+** (depending on your stack)

## Installation Options

### Global Install (Recommended)
```bash
curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash
```

### Project-Specific
```bash
# Clone repo first, then copy
git clone https://github.com/benjaminr/claude-code-essentials.git
cp -r claude-code-essentials/.claude/ /path/to/your/project/
```

## Benefits

- **Structured approach** to feature development
- **Quality validation** at each stage
- **Standardised requirements** format (EARS notation)
- **Consistent development** workflow
- **Built-in coding** standards
- **Parallel execution** for multiple features simultaneously
- **Subagent coordination** for scalable development
- **Progress tracking** across complex multi-feature projects
- **Rapid prototyping** from high-level ideas to working code
- **Intelligent feature breakdown** with MVP prioritisation
- **End-to-end pipeline orchestration** for complete applications

---

Run the installer above, then use `/init-sdd` in any project.