---
description: Run complete spec-driven workflow automatically
argument-hint: [feature-name] [description]
allowed-tools: Read, Write, Bash, Glob, TodoWrite
---

# Complete Spec-Driven Workflow (YOLO Mode)

You are running the complete spec-driven development workflow automatically. Your task is to execute all four stages in sequence: requirements → design → planning → build setup.

## Input
- **Feature Name**: $ARGUMENTS (first argument)
- **Description**: $ARGUMENTS (remaining arguments)

## Your Task

Execute all stages of the spec-driven workflow with validation checkpoints between stages. This is "YOLO mode" - optimized for speed while maintaining quality.

## Workflow Execution

### Stage 1: Requirements Generation
1. Create spec directory structure: `specs/[feature-name]/`
2. Generate comprehensive `requirements.md` with:
   - Feature overview and user stories
   - Functional requirements in EARS notation
   - Non-functional requirements
   - Acceptance criteria and dependencies
3. **Quick Validation**: Check requirements completeness
4. **Proceed if**: Requirements have proper EARS notation and clear acceptance criteria

### Stage 2: Design Generation  
1. Read `requirements.md`
2. Generate comprehensive `design.md` with:
   - System architecture and components
   - Data flow and API design
   - Data models and database design
   - Security and performance considerations
3. **Quick Validation**: Check design addresses all requirements
4. **Proceed if**: Architecture is clear and technically sound

### Stage 3: Implementation Planning
1. Read `requirements.md` and `design.md`
2. Generate detailed `tasks.md` with:
   - Phased implementation approach
   - Discrete, actionable tasks with clear outcomes
   - Dependencies and effort estimates
   - Testing and deployment tasks
3. **Quick Validation**: Check tasks cover all design components
4. **Proceed if**: Tasks are well-defined and properly sequenced

### Stage 4: Build Setup
1. Read all specification files
2. Analyze existing codebase structure
3. Set up initial implementation structure
4. Mark first few tasks as ready to start
5. Provide implementation roadmap

## Validation Checkpoints

Between each stage, perform quick validation:
- **Requirements**: EARS notation present, acceptance criteria clear
- **Design**: Architecture addresses requirements, components defined
- **Planning**: Tasks are actionable, dependencies identified
- **Build**: Ready to begin implementation

## Progress Tracking

Use TodoWrite to track stage completion:
1. Requirements generation
2. Requirements validation  
3. Design generation
4. Design validation
5. Planning generation
6. Planning validation
7. Build setup
8. Final review

## Output Format

```markdown
# 🚀 Complete Spec Generated: [Feature Name]

## 📋 Requirements Stage ✅
- User stories defined
- [X] functional requirements in EARS notation
- Non-functional requirements specified
- Acceptance criteria established

## 🏗️ Design Stage ✅  
- System architecture documented
- [X] components with clear responsibilities
- Data flow and API design complete
- Security and performance considerations included

## 📝 Planning Stage ✅
- [X] discrete tasks across [Y] phases
- Dependencies and estimates provided
- Testing strategy included
- Deployment plan outlined

## 🔨 Build Stage Ready
- Codebase analyzed
- Implementation structure prepared
- First tasks ready for execution

## 📁 Generated Files
- `specs/[feature-name]/requirements.md`
- `specs/[feature-name]/design.md`  
- `specs/[feature-name]/tasks.md`

## 🎯 Next Steps
1. Review generated specification files
2. Run `/validate` for detailed quality check
3. Begin implementation with `/build`
4. Track progress with `/status`

## 📊 Quality Metrics
- **Requirements**: [X] EARS-formatted requirements
- **Design Components**: [Y] documented components  
- **Implementation Tasks**: [Z] actionable tasks
- **Estimated Effort**: [Total effort estimate]
```

## Error Handling

If any stage fails validation:
1. **Stop the workflow** at the failed stage
2. **Provide specific feedback** on what failed
3. **Suggest corrections** before continuing
4. **Allow manual refinement** with `/refine` command

## Success Criteria
- All four stages completed successfully
- Each stage passes quick validation
- Generated files are complete and well-structured
- Implementation is ready to begin
- Clear next steps provided

Execute the complete workflow efficiently while maintaining spec quality and providing clear progress updates throughout the process.