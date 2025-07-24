# Claude Code Essentials

A collection of Claude Code slash commands for systematic development workflows.

## What This Gives You

29+ slash commands for feature development:
- **Requirements → Design → Planning → Implementation** workflow
- **EARS notation** for clear, testable requirements  
- **Built-in validation** at each stage
- **Memory integration** for project context

## Quick Install (Global Setup)

```bash
# Standard installation (preserves existing commands)
curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash

# Clean installation (removes existing commands with backup)
curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash -s -- --clean

# Local installation with clean option
bash quick-install.sh --clean
```

This installs commands to your `~/.claude` directory, making them available across all projects. Use `--clean` for a fresh installation that backs up existing commands.

## Quick Start

```bash
# Initialize in any project
/project:init-sdd

# Create your first spec
/sdd:core:spec user-auth "Secure authentication with 2FA"

# Follow the workflow
/sdd:core:next    # Generate design
/sdd:core:next    # Create implementation plan  
/sdd:core:build   # Start coding with guided tasks
```

## Core Workflow

### The 4-Stage Process

```
Requirements → Design → Planning → Implementation
     ↓           ↓         ↓           ↓
   /spec     /design    /plan      /build
```

**Manual Control:**
- `/sdd:core:spec [name] [description]` - Generate EARS requirements
- `/sdd:core:next` - Progress to next validated stage
- `/sdd:core:build` - Execute implementation with task tracking

**Automatic Mode:**
- `/sdd:core:spec-all [name] [description]` - Generate complete specification

### Quality Control

- `/sdd:core:validate` - Check current stage completeness
- `/sdd:core:status` - Overview of all specifications  
- `/sdd:core:refine [instructions]` - Improve current stage
- `/sdd:core:reset [stage]` - Reset with backup

## Additional Commands

**📋 SDD Core Workflow:**
- `/sdd:core:spec`, `/sdd:core:design`, `/sdd:core:plan`, `/sdd:core:build`, `/sdd:core:validate`, `/sdd:core:next`
- `/sdd:core:status`, `/sdd:core:refine`, `/sdd:core:reset`, `/sdd:core:spec-all`

**🔄 SDD Orchestration:**
- `/sdd:orchestration:parallel [command] [feature1,feature2,...]` - Execute commands across multiple features
- `/sdd:orchestration:prototype [idea] [mvp|full] [tech-stack]` - Build complete prototypes from ideas

**🔍 Code Understanding:**
- `/code:understand:explain [code]` - Explain how code works with architecture insights
- `/code:understand:trace [flow]` - Trace execution paths through codebase
- `/code:understand:document [path]` - Generate comprehensive documentation

**🛠️ Code Improvement:**
- `/code:improve:debug [error|image]` - Error analysis with image support and extended thinking
- `/code:improve:refactor [code]` - Improve code structure and maintainability
- `/code:improve:clean [path]` - Code cleanup and formatting
- `/code:improve:optimize [code]` - Performance analysis
- `/code:improve:security [code]` - Security analysis

**📦 Project Management:**
- `/project:init-sdd` - Initialize spec-driven development
- `/project:setup` - Configure development environment
- `/project:dependencies` - Analyse and manage dependencies
- `/project:todo [path]` - Extract and organise TODOs
- `/project:migrate [from] [to]` - Migration assistance

**🧪 Testing:**
- `/test:test [path]` - Generate and run tests against specifications
- `/test:coverage [path]` - Analyse test coverage and generate missing tests

**⚡ Development Tools:**
- `/tools:api [description|path]` - Create new APIs or improve existing ones with industry best practices

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

## Command Organization

Commands are now organized thematically for better discoverability:

```
~/.claude/commands/
├── sdd/                   # Spec-Driven Development
│   ├── core/             # Core SDD workflow (11 commands)
│   │   ├── build.md      # Guided implementation
│   │   ├── design.md     # Technical design
│   │   ├── next.md       # Progress to next stage
│   │   ├── plan.md       # Implementation planning
│   │   ├── refine.md     # Improve current stage
│   │   ├── reset.md      # Reset SDD stages
│   │   ├── review.md     # Review against specs
│   │   ├── spec.md       # Generate specs
│   │   ├── spec-all.md   # Complete workflow automation
│   │   ├── status.md     # Progress overview
│   │   └── validate.md   # Validate stages
│   └── orchestration/    # SDD process management (2 commands)
│       ├── parallel.md   # Multi-feature execution
│       └── prototype.md  # Complete prototyping pipeline
├── code/                 # Code operations
│   ├── understand/       # Code analysis (2 commands)
│   │   ├── explain.md    # Explain code with architecture insights
│   │   └── trace.md      # Trace execution paths
│   └── improve/          # Code enhancement (2 commands)
│       ├── debug.md      # Debug with image support and extended thinking
│       └── refactor.md   # Improve code structure
├── project/              # Project management (8 commands)
│   ├── clean.md         # Code cleanup and formatting
│   ├── dependencies.md  # Dependency management
│   ├── document.md      # Generate documentation
│   ├── init-sdd.md     # Initialize spec-driven development
│   ├── migrate.md       # Migration assistance
│   ├── optimize.md      # Performance analysis
│   ├── security.md      # Security analysis
│   ├── setup.md         # Environment setup
│   └── todo.md          # Extract and organise TODOs
├── test/                 # Testing (2 commands)
│   ├── coverage.md      # Test coverage analysis and generation
│   └── test.md          # Generate and run tests
└── tools/               # Development tools (1 command)
    └── api.md           # API development with industry best practices

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
/sdd:core:spec payment-system "Process payments securely with Stripe"

# Review generated requirements, then proceed
/sdd:core:next  # Creates technical design

# Review architecture, then proceed  
/sdd:core:next  # Creates implementation tasks

# Start building with guided task tracking
/sdd:core:build

# Throughout development
/sdd:core:validate  # Check quality
/test:test api/payments.py  # Generate tests
/code:improve:debug "Payment webhook failing"  # Debug issues
/test:coverage api/  # Check test coverage
```

### Parallel Multi-Feature Development
```bash
# Generate specs for multiple features simultaneously
/sdd:orchestration:parallel spec user-auth,payment-api,admin-dashboard

# Design all features in parallel
/sdd:orchestration:parallel design user-auth,payment-api,admin-dashboard  

# Create implementation plans for all
/sdd:orchestration:parallel plan user-auth,payment-api,admin-dashboard

# Build all features with coordinated task tracking
/sdd:orchestration:parallel build user-auth,payment-api,admin-dashboard

# Quality assurance across all features
/sdd:orchestration:parallel validate user-auth,payment-api,admin-dashboard
/sdd:orchestration:parallel test auth-service,payment-service,admin-service
```

### Rapid Prototype Development
```bash
# Build complete MVP from high-level idea
/sdd:orchestration:prototype "user facing coffee app" mvp "React + Node.js"

# Generate full e-commerce platform  
/sdd:orchestration:prototype "online marketplace for handmade goods" full

# Create social networking prototype
/sdd:orchestration:prototype "local community events app" mvp "mobile-first"

# Build productivity tool
/sdd:orchestration:prototype "team collaboration workspace" mvp "TypeScript + PostgreSQL"
```

## Requirements

- **Claude Code** CLI installed
- **Git** (for project tracking)
- **Python 3.9+** or **Node.js 18+** (depending on your stack)

## Installation Options

### Global Install (Recommended)
```bash
# Standard installation
curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash

# Clean installation (removes existing commands with backup)
curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash -s -- --clean
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

Run the installer above, then use `/project:init-sdd` in any project.

## Installation Options

- **Standard**: `bash quick-install.sh` - Preserves existing commands
- **Clean**: `bash quick-install.sh --clean` - Fresh install with backup of existing commands
- **Help**: `bash quick-install.sh --help` - Show all installation options