# Claude Code Essentials

A collection of Claude Code slash commands for systematic development workflows.

## What This Gives You

**29+ slash commands** for systematic development:
- **Requirements → Design → Planning → Implementation** workflow
- **EARS notation** for clear, testable requirements  
- **Built-in validation** at each stage
- **Memory integration** for project context

**9 specialized sub-agents** for comprehensive development:
- **Code Standards Enforcer** - Pedantic code quality with British English consistency
- **Documentation Generator** - Dual-layer docs with quick-start guides and detailed references
- **Performance Profiler** - Proactive optimization with quantified improvements
- **Test Engineer** - High-coverage testing with realistic data and minimal mocking
- **Infrastructure Engineer** - AWS + Terraform with Grafana monitoring
- **Full-Stack Engineer** - Next.js + FastAPI with type-safe APIs
- **AI Engineer** - Full-spectrum ML/AI with LLM expertise and microservices
- **Git Workflow Assistant** - GitHub Flow with strict commit standards
- **Design & Frontend Assistant** - Mobile-first Tailwind with reusable design systems

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

## Project Structure

After installation, you'll have:

```
~/.claude/
├── commands/              # 29+ slash commands organized thematically
│   ├── sdd/              # Spec-Driven Development workflow
│   ├── code/             # Code analysis and improvement
│   ├── project/          # Project management utilities
│   ├── test/             # Testing and coverage tools
│   └── tools/            # Development utilities
└── agents/               # 9 specialized sub-agents
    ├── code-standards-enforcer.md      # Pedantic quality control
    ├── documentation-generator.md       # Dual-layer documentation
    ├── performance-profiler.md         # Proactive optimization
    ├── test-engineer.md                # Strategic test coverage
    ├── infra-engineer.md               # AWS + Terraform infrastructure
    ├── fullstack-engineer.md           # Next.js + FastAPI development
    ├── ai-engineer.md                  # Full-spectrum ML/AI solutions
    ├── git-workflow-assistant.md       # GitHub Flow with strict standards
    └── design-frontend-assistant.md    # Mobile-first design systems

# In each project after /project:init-sdd:
specs/[feature-name]/
├── CLAUDE.md            # Feature context and decisions
├── requirements.md      # EARS requirements specification
├── design.md           # Technical architecture and design
└── tasks.md            # Implementation plan and progress
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

**Systematic Development:**
- **Structured approach** with Requirements → Design → Planning → Implementation
- **Quality validation** at each stage with built-in quality gates
- **EARS notation** for clear, testable requirements
- **Memory integration** for project context and decisions

**Specialized Expertise:**
- **9 custom sub-agents** covering all aspects of development
- **Automatic delegation** based on task requirements
- **Consistent standards** enforced across all work
- **British English** consistency in all documentation and code

**Scalable Workflows:**
- **Parallel execution** for multiple features simultaneously
- **Rapid prototyping** from high-level ideas to working code
- **End-to-end orchestration** for complete applications
- **Progress tracking** across complex multi-feature projects

**Quality Assurance:**
- **Pedantic code standards** with detailed explanations
- **Performance optimization** with quantified improvements
- **Comprehensive testing** with realistic data and minimal mocking
- **Security-conscious** infrastructure and development practices

---

Run the installer above, then use `/project:init-sdd` in any project.

## Installation Options

- **Standard**: `bash quick-install.sh` - Preserves existing commands
- **Clean**: `bash quick-install.sh --clean` - Fresh install with backup of existing commands
- **Help**: `bash quick-install.sh --help` - Show all installation options