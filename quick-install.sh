#!/bin/bash

# Claude Code Essentials Quick Installer
# Run with: curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash
# Options: --clean (remove existing commands before install)

set -e  # Exit on any error

# Command line options
CLEAN_INSTALL=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --clean)
            CLEAN_INSTALL=true
            shift
            ;;
        -h|--help)
            echo "Claude Code Essentials Quick Installer"
            echo ""
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --clean    Remove existing slash commands before installation"
            echo "  -h, --help Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0              # Standard installation (preserves existing commands)"
            echo "  $0 --clean     # Clean installation (removes existing commands)"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo ""
    echo "======================================="
    echo "  Claude Code Essentials Quick Install"
    echo "======================================="
    echo ""
}

# Check prerequisites
check_requirements() {
    print_status "Checking requirements..."
    
    # Check if Claude Code is installed
    if ! command -v claude &> /dev/null; then
        print_error "Claude Code CLI not found. Please install Claude Code first:"
        echo "  Visit: https://claude.ai/code"
        exit 1
    fi
    
    print_success "Claude Code CLI found"
    
    # Check curl or wget
    if ! command -v curl &> /dev/null && ! command -v wget &> /dev/null; then
        print_error "Neither curl nor wget found. Please install one of them."
        exit 1
    fi
    
    # Check Git
    if ! command -v git &> /dev/null; then
        print_warning "Git not found. Some commands may not work optimally."
    else
        print_success "Git found"
    fi
}

# Download function with fallback
download_file() {
    local url="$1"
    local output="$2"
    
    if command -v curl &> /dev/null; then
        curl -sSL "$url" -o "$output"
    elif command -v wget &> /dev/null; then
        wget -q "$url" -O "$output"
    else
        print_error "No download tool available"
        exit 1
    fi
}

# Clean existing commands if requested
clean_existing_commands() {
    if [ "$CLEAN_INSTALL" = true ]; then
        print_status "Cleaning existing slash commands..."
        
        if [ -d ~/.claude/commands ]; then
            # Backup existing commands first
            if [ -n "$(ls -A ~/.claude/commands 2>/dev/null)" ]; then
                local backup_dir="$HOME/.claude/commands.backup.$(date +%Y%m%d_%H%M%S)"
                print_status "Backing up existing commands to $backup_dir"
                cp -r ~/.claude/commands "$backup_dir"
            fi
            
            # Remove existing commands
            rm -rf ~/.claude/commands/*
            print_success "Existing commands cleaned and backed up"
        else
            print_status "No existing commands to clean"
        fi
    fi
}

# Create directory structure
setup_directories() {
    print_status "Setting up global Claude directory structure..."
    
    # Create ~/.claude if it doesn't exist
    mkdir -p ~/.claude/commands/sdd/core
    mkdir -p ~/.claude/commands/sdd/orchestration
    mkdir -p ~/.claude/commands/code/understand
    mkdir -p ~/.claude/commands/code/improve
    mkdir -p ~/.claude/commands/project
    mkdir -p ~/.claude/commands/test
    mkdir -p ~/.claude/commands/tools
    mkdir -p ~/.claude/templates
    mkdir -p ~/.claude/agents
    
    print_success "Directory structure created"
}

# Download and install commands
install_commands() {
    print_status "Downloading and installing slash commands..."
    
    local base_url="https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/.claude/commands"
    local temp_dir=$(mktemp -d)
    
    # List of all command files with their subdirectories
    local commands=(
        "sdd/core/build.md" "sdd/core/design.md" "sdd/core/next.md"
        "sdd/core/plan.md" "sdd/core/refine.md" "sdd/core/reset.md"
        "sdd/core/review.md" "sdd/core/spec.md" "sdd/core/spec-all.md"
        "sdd/core/status.md" "sdd/core/validate.md"
        "sdd/orchestration/parallel.md" "sdd/orchestration/prototype.md"
        "code/understand/explain.md" "code/understand/trace.md"
        "code/improve/debug.md" "code/improve/refactor.md"
        "project/clean.md" "project/dependencies.md" "project/document.md"
        "project/init-sdd.md" "project/migrate.md" "project/optimize.md"
        "project/security.md" "project/setup.md" "project/todo.md"
        "test/coverage.md" "test/test.md"
        "tools/api.md"
    )
    
    local downloaded=0
    
    for cmd in "${commands[@]}"; do
        local cmd_dir=$(dirname "$cmd")
        local cmd_file=$(basename "$cmd")
        
        # Create subdirectory in temp
        mkdir -p "$temp_dir/$cmd_dir"
        
        if download_file "$base_url/$cmd" "$temp_dir/$cmd" 2>/dev/null; then
            # Create target directory and copy file
            mkdir -p "~/.claude/commands/$cmd_dir"
            cp "$temp_dir/$cmd" "~/.claude/commands/$cmd"
            ((downloaded++))
        else
            print_warning "Failed to download $cmd"
        fi
    done
    
    print_success "Installed $downloaded slash commands"
    
    # Cleanup
    rm -rf "$temp_dir"
}

# Download and install sub-agents
install_agents() {
    print_status "Downloading and installing specialized sub-agents..."
    
    local base_url="https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/.claude/agents"
    local temp_dir=$(mktemp -d)
    
    # List of all agent files
    local agents=(
        "code-standards-enforcer.md"
        "documentation-generator.md"
        "performance-profiler.md"
        "test-engineer.md"
        "infra-engineer.md"
        "fullstack-engineer.md"
        "ai-engineer.md"
        "git-workflow-assistant.md"
        "design-frontend-assistant.md"
    )
    
    local downloaded=0
    
    for agent in "${agents[@]}"; do
        if download_file "$base_url/$agent" "$temp_dir/$agent" 2>/dev/null; then
            cp "$temp_dir/$agent" ~/.claude/agents/
            ((downloaded++))
        else
            print_warning "Failed to download $agent"
        fi
    done
    
    print_success "Installed $downloaded specialized sub-agents"
    
    # Cleanup
    rm -rf "$temp_dir"
}

# Download and install templates
install_templates() {
    print_status "Installing templates..."
    
    local base_url="https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/.claude/templates"
    
    if download_file "$base_url/command-template.md" ~/.claude/templates/command-template.md 2>/dev/null; then
        print_success "Templates installed"
    else
        print_warning "Failed to download templates, skipping..."
    fi
}

# Download and install global CLAUDE.md
install_global_config() {
    print_status "Installing global development standards..."
    
    local config_url="https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/CLAUDE.md"
    
    # Backup existing CLAUDE.md if it exists
    if [ -f ~/.claude/CLAUDE.md ]; then
        cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup
        print_warning "Existing CLAUDE.md backed up to CLAUDE.md.backup"
    fi
    
    if download_file "$config_url" ~/.claude/CLAUDE.md 2>/dev/null; then
        print_success "Global development standards installed"
    else
        print_warning "Failed to download CLAUDE.md, skipping global config..."
    fi
}

# Set permissions
set_permissions() {
    print_status "Setting permissions..."
    
    find ~/.claude/commands -name "*.md" -exec chmod 644 {} \; 2>/dev/null || true
    find ~/.claude/templates -name "*.md" -exec chmod 644 {} \; 2>/dev/null || true
    find ~/.claude/agents -name "*.md" -exec chmod 644 {} \; 2>/dev/null || true
    chmod 644 ~/.claude/CLAUDE.md 2>/dev/null || true
    
    print_success "Permissions set"
}

# Verify installation
verify_installation() {
    print_status "Verifying installation..."
    
    # Check if commands were installed
    if [ -f ~/.claude/commands/sdd/core/spec.md ]; then
        print_success "Core commands installed successfully"
    else
        print_error "Installation verification failed"
        exit 1
    fi
    
    # Check if agents were installed
    if [ -f ~/.claude/agents/code-standards-enforcer.md ]; then
        print_success "Sub-agents installed successfully"
    else
        print_warning "Sub-agents installation may have failed"
    fi
    
    # Count installed commands and agents
    local command_count=$(find ~/.claude/commands -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    local agent_count=$(find ~/.claude/agents -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    print_success "Total commands available: $command_count"
    print_success "Total sub-agents available: $agent_count"
}

# Show next steps
show_next_steps() {
    echo ""
    echo "🎉 Installation Complete!"
    echo ""
    if [ "$CLEAN_INSTALL" = true ]; then
        echo "✨ Clean installation completed - all old commands replaced"
        echo ""
    fi
    echo "Next steps:"
    echo "  1. Navigate to any project directory"
    echo "  2. Run: /init-sdd"
    echo "  3. Start your first spec: /spec feature-name \"Description\""
    echo ""
    echo "Available commands (organised by category):"
    echo "  📋 SDD Core: /spec, /design, /plan, /build, /validate, /next"
    echo "  🔄 SDD Orchestration: /parallel, /prototype"
    echo "  🔍 Code Understanding: /explain, /trace"
    echo "  🛠️  Code Improvement: /debug, /refactor"
    echo "  📦 Project Management: /clean, /dependencies, /document, /setup"
    echo "  🧪 Testing: /test, /coverage"
    echo "  ⚡ Tools: /api"
    echo ""
    echo "🤖 9 Specialized Sub-Agents Available:"
    echo "  • Code Standards Enforcer - Pedantic quality control"
    echo "  • Documentation Generator - Dual-layer documentation"
    echo "  • Performance Profiler - Proactive optimization"
    echo "  • Test Engineer - Strategic test coverage"
    echo "  • Infrastructure Engineer - AWS + Terraform"
    echo "  • Full-Stack Engineer - Next.js + FastAPI"
    echo "  • AI Engineer - Full-spectrum ML/AI"
    echo "  • Git Workflow Assistant - GitHub Flow"
    echo "  • Design & Frontend Assistant - Mobile-first design"
    echo ""
    echo "Access sub-agents with: /agents (to manage) or mention them in requests"
    echo "Documentation: Each command includes built-in help and examples"
    echo "Global config: ~/.claude/CLAUDE.md"
    echo ""
    if [ "$CLEAN_INSTALL" = true ]; then
        echo "💾 Previous commands backed up in ~/.claude/commands.backup.*"
        echo ""
    fi
    echo "Repository: https://github.com/benjaminr/claude-code-essentials"
    echo ""
}

# Install from local directory
install_local() {
    print_status "Installing from local directory..."
    
    # Copy all commands
    if [ -d ".claude/commands" ]; then
        # Create subdirectories first
        mkdir -p ~/.claude/commands/sdd/{core,orchestration}
        mkdir -p ~/.claude/commands/code/{understand,improve}
        mkdir -p ~/.claude/commands/{project,test,tools}
        
        cp -r .claude/commands/* ~/.claude/commands/
        local command_count=$(find .claude/commands -name "*.md" | wc -l | tr -d ' ')
        print_success "Installed $command_count slash commands"
    else
        print_error "Commands directory not found. Are you in the correct directory?"
        exit 1
    fi
    
    # Copy all agents
    if [ -d ".claude/agents" ]; then
        cp -r .claude/agents/* ~/.claude/agents/
        local agent_count=$(find .claude/agents -name "*.md" | wc -l | tr -d ' ')
        print_success "Installed $agent_count specialized sub-agents"
    else
        print_warning "No agents directory found, skipping..."
    fi
    
    # Copy templates
    if [ -d ".claude/templates" ]; then
        cp -r .claude/templates/* ~/.claude/templates/
        print_success "Templates installed"
    else
        print_warning "No templates directory found, skipping..."
    fi
    
    # Copy global CLAUDE.md
    if [ -f "CLAUDE.md" ]; then
        # Backup existing CLAUDE.md if it exists
        if [ -f ~/.claude/CLAUDE.md ]; then
            cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup
            print_warning "Existing CLAUDE.md backed up to CLAUDE.md.backup"
        fi
        
        cp CLAUDE.md ~/.claude/CLAUDE.md
        print_success "Global development standards installed"
    else
        print_warning "CLAUDE.md not found, skipping global config..."
    fi
}

# Main installation flow
main() {
    print_header
    
    # Show clean install notice
    if [ "$CLEAN_INSTALL" = true ]; then
        print_status "Clean installation mode enabled"
    fi
    
    check_requirements
    clean_existing_commands
    setup_directories
    
    # Check if running locally
    if [ -f "README.md" ] && [ -d ".claude" ]; then
        print_status "Local installation detected"
        install_local
    else
        print_status "Remote installation"
        install_commands
        install_agents
        install_templates
        install_global_config
    fi
    
    set_permissions
    verify_installation
    show_next_steps
}

# Run installation
main "$@"