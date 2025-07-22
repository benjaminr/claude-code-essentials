#!/bin/bash

# Claude Code Essentials Quick Installer
# Run with: curl -sSL https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/quick-install.sh | bash

set -e  # Exit on any error

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

# Create directory structure
setup_directories() {
    print_status "Setting up global Claude directory structure..."
    
    # Create ~/.claude if it doesn't exist
    mkdir -p ~/.claude/commands
    mkdir -p ~/.claude/templates
    
    print_success "Directory structure created"
}

# Download and install commands
install_commands() {
    print_status "Downloading and installing slash commands..."
    
    local base_url="https://raw.githubusercontent.com/benjaminr/claude-code-essentials/main/.claude/commands"
    local temp_dir=$(mktemp -d)
    
    # List of all command files
    local commands=(
        "api.md" "build.md" "clean.md" "debug.md" "dependencies.md"
        "design.md" "document.md" "explain.md" "init-sdd.md" "migrate.md"
        "next.md" "optimize.md" "parallel.md" "plan.md" "prototype.md"
        "refactor.md" "refine.md" "reset.md" "review.md" "security.md"
        "setup.md" "spec.md" "spec-all.md" "status.md" "test.md" "todo.md"
        "validate.md"
    )
    
    local downloaded=0
    
    for cmd in "${commands[@]}"; do
        if download_file "$base_url/$cmd" "$temp_dir/$cmd" 2>/dev/null; then
            cp "$temp_dir/$cmd" ~/.claude/commands/
            ((downloaded++))
        else
            print_warning "Failed to download $cmd"
        fi
    done
    
    print_success "Installed $downloaded slash commands"
    
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
    chmod 644 ~/.claude/CLAUDE.md 2>/dev/null || true
    
    print_success "Permissions set"
}

# Verify installation
verify_installation() {
    print_status "Verifying installation..."
    
    # Check if commands were installed
    if [ -f ~/.claude/commands/spec.md ]; then
        print_success "Core commands installed successfully"
    else
        print_error "Installation verification failed"
        exit 1
    fi
    
    # Count installed commands
    local command_count=$(find ~/.claude/commands -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    print_success "Total commands available: $command_count"
}

# Show next steps
show_next_steps() {
    echo ""
    echo "🎉 Installation Complete!"
    echo ""
    echo "Next steps:"
    echo "  1. Navigate to any project directory"
    echo "  2. Run: /init-sdd"
    echo "  3. Start your first spec: /spec feature-name \"Description\""
    echo ""
    echo "Available commands:"
    echo "  Core Workflow: /spec, /design, /plan, /build, /validate, /next"
    echo "  Rapid Development: /prototype [idea] [mvp|full] [tech-stack]"
    echo "  Parallel Execution: /parallel [command] [feature1,feature2,...]"
    echo "  Development: /debug, /test, /optimize, /clean, /dependencies"
    echo "  Management: /status, /refine, /reset, /spec-all"
    echo ""
    echo "Documentation: Each command includes built-in help and examples"
    echo "Global config: ~/.claude/CLAUDE.md"
    echo ""
    echo "Repository: https://github.com/benjaminr/claude-code-essentials"
    echo ""
}

# Install from local directory
install_local() {
    print_status "Installing from local directory..."
    
    # Copy all commands
    if [ -d ".claude/commands" ]; then
        cp -r .claude/commands/* ~/.claude/commands/
        local command_count=$(find .claude/commands -name "*.md" | wc -l | tr -d ' ')
        print_success "Installed $command_count slash commands"
    else
        print_error "Commands directory not found. Are you in the correct directory?"
        exit 1
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
    
    check_requirements
    setup_directories
    
    # Check if running locally
    if [ -f "README.md" ] && [ -d ".claude" ]; then
        print_status "Local installation detected"
        install_local
    else
        print_status "Remote installation"
        install_commands
        install_templates
        install_global_config
    fi
    
    set_permissions
    verify_installation
    show_next_steps
}

# Run installation
main "$@"