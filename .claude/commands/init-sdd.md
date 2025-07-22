---
description: Initialize project for spec-driven development workflow
allowed-tools: Write, Read, Bash, LS
---

# Initialize Spec-Driven Development

Set up your project to use the spec-driven development workflow with proper memory configuration and templates.

## Your Task

1. **Check existing setup**: Look for current CLAUDE.md and .claude directory
2. **Create directory structure**: Set up necessary directories for specs and templates
3. **Initialize CLAUDE.md**: Create or enhance project memory with SDD workflow
4. **Set up templates**: Create template files for consistent spec generation
5. **Provide usage guidance**: Show how to get started with the workflow

## Directory Structure to Create

```
.claude/
  commands/           # (already exists with SDD commands)
  templates/          # Template files for specs
    CLAUDE.md         # Project memory template
    requirements.md   # Requirements template
    design.md         # Design template  
    tasks.md          # Tasks template
specs/                # Directory for all specifications
  .gitkeep            # Ensure directory is tracked
```

## CLAUDE.md Setup

If CLAUDE.md doesn't exist, create it using the template.
If it exists, add SDD workflow section and import the template:

```markdown
# Import spec-driven development workflow
@.claude/templates/CLAUDE.md

# [Existing project content...]
```

## Template Files

Create template files that teams can customize:

### Requirements Template
Basic structure with EARS notation examples and common sections.

### Design Template  
Architecture, API design, and technical consideration templates.

### Tasks Template
Implementation plan structure with phases and task formatting.

## Success Criteria
- .claude/templates/ directory exists with template files
- CLAUDE.md includes SDD workflow information  
- specs/ directory is created and ready for use
- Clear instructions provided for team adoption

## Output Format

```markdown
# 🚀 Spec-Driven Development Initialized

## ✅ Setup Complete
- Created .claude/templates/ with workflow templates
- Updated/created CLAUDE.md with SDD workflow
- Created specs/ directory for specifications
- All slash commands are ready to use

## 🎯 Quick Start
1. Create your first spec: `/spec user-auth "Secure user authentication"`
2. Progress through stages: `/next` (after each validation)  
3. Track progress: `/status`
4. Build features: `/build`

## 📁 Directory Structure
- `specs/` - All feature specifications
- `.claude/commands/` - SDD slash commands
- `.claude/templates/` - Customizable templates

## 🔧 Customization
Edit templates in `.claude/templates/` to match your team's standards:
- Requirements format and sections
- Design documentation structure  
- Task breakdown preferences
- Coding and testing standards

## 💡 Pro Tips
- Use `/spec-all` for rapid spec generation
- Customize CLAUDE.md with your tech stack and conventions
- Create feature-specific CLAUDE.md files in each spec directory
- Use memory imports to reference common patterns: @api-standards.md

Your project is now ready for systematic, specification-driven development!
```

Initialize the project for spec-driven development workflow.