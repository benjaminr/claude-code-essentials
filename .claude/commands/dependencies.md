---
description: Analyze and manage project dependencies
allowed-tools: Read, Write, Bash, Glob, WebSearch
---

# Analyze Dependencies

You are analyzing project dependencies to identify outdated packages, security vulnerabilities, unused dependencies, and optimization opportunities.

## Your Task

Perform comprehensive dependency analysis:

1. **Inventory Dependencies** - List all project dependencies
2. **Check for Issues** - Outdated, vulnerable, or problematic packages
3. **Analyze Usage** - Find unused or duplicate dependencies
4. **Suggest Improvements** - Recommendations for optimization

## Analysis Approach

### 1. Dependency Discovery
Check for dependency files:
- `package.json` / `package-lock.json` (Node.js)
- `requirements.txt` / `Pipfile` (Python)
- `Gemfile` / `Gemfile.lock` (Ruby)
- `Cargo.toml` / `Cargo.lock` (Rust)
- `go.mod` / `go.sum` (Go)
- `composer.json` (PHP)
- `pom.xml` / `build.gradle` (Java)

### 2. Analysis Report

```markdown
# 📦 Dependency Analysis Report

## Project Overview
**Language/Framework**: [Detected stack]
**Total Dependencies**: [X] direct, [Y] transitive
**Last Updated**: [Date of last dependency update]

## Dependency Summary

### Direct Dependencies ([count])
| Package | Current | Latest | Status | Usage |
|---------|---------|--------|--------|--------|
| [package] | [version] | [version] | 🟢 Current / 🟡 Outdated / 🔴 Major Update | ✓ Used |

### Dev Dependencies ([count])
| Package | Current | Latest | Status |
|---------|---------|--------|--------|
| [package] | [version] | [version] | [status] |

## 🚨 Critical Issues

### Security Vulnerabilities
⚠️ **[package@version]**
- Vulnerability: [CVE-ID or description]
- Severity: [Critical/High/Medium/Low]
- Fixed in: [version]
- Recommendation: Update to [version]

### Deprecated Packages
📦 **[package]**
- Deprecated since: [date]
- Replacement: [new package]
- Migration guide: [link]

## 📊 Update Recommendations

### Safe Updates (Patch/Minor)
```bash
# These updates are backwards compatible
npm update [package1] [package2]
# or
npm install [package1]@[version] [package2]@[version]
```

### Major Updates (Breaking Changes)
1. **[package]** [current] → [latest]
   - Breaking changes: [summary]
   - Migration effort: [Low/Medium/High]
   - [Link to migration guide]

## 🔍 Optimization Opportunities

### Unused Dependencies
Found [X] potentially unused dependencies:
- `[package]` - No imports found
- `[package2]` - Only in test files

**Remove with**:
```bash
npm uninstall [package1] [package2]
```

### Duplicate Functionality
- `[package1]` and `[package2]` provide similar functionality
  - Recommendation: Use [preferred] and remove [other]

### Bundle Size Impact
Top 5 largest dependencies:
1. `[package]` - [size] (Consider: [lighter alternative])
2. `[package2]` - [size]

### Alternative Packages
- Replace `[heavy-package]` with `[lighter-alternative]`
  - Size reduction: [X]%
  - Features: [comparison]

## 📈 Dependency Health Score

**Overall Score**: [X]/100

Breakdown:
- 🟢 Up-to-date: [X]%
- 🟡 Minor updates: [Y]%  
- 🔴 Major updates: [Z]%
- ⚠️ Vulnerabilities: [count]
- 📦 Deprecated: [count]

## 🔧 Maintenance Tasks

### Immediate Actions
1. [ ] Fix [X] security vulnerabilities
2. [ ] Update [Y] critical packages
3. [ ] Remove [Z] unused dependencies

### Short Term
1. [ ] Plan major version migrations
2. [ ] Replace deprecated packages
3. [ ] Optimize bundle size

### Long Term
1. [ ] Set up automated dependency updates
2. [ ] Create dependency update policy
3. [ ] Document upgrade procedures

## 🤖 Automation Suggestions

### Dependabot Configuration
```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 10
```

### Pre-commit Hooks
```yaml
- repo: local
  hooks:
    - id: check-dependencies
      name: Check for vulnerabilities
      entry: npm audit
      language: system
      pass_filenames: false
```

## 📋 Dependency Policy Recommendations

1. **Update Schedule**: Weekly for patches, monthly for minor
2. **Security Policy**: Fix critical within 24h, high within 1 week
3. **Testing Requirements**: Full test suite for major updates
4. **Documentation**: Update CHANGELOG.md with dependency changes
```

## Analysis Features

### Version Analysis
- Semantic versioning compliance
- Update frequency patterns
- Breaking change history

### License Checking
- License compatibility
- Commercial use restrictions
- Attribution requirements

### Performance Impact
- Install time
- Build time impact
- Runtime performance

### Ecosystem Health
- Weekly downloads
- GitHub stars/issues
- Maintenance status
- Community activity

## Special Checks

### Monorepo Support
- Workspace dependencies
- Cross-package versions
- Shared dependencies

### Lock File Analysis
- Integrity checks
- Version pinning
- Reproducible builds

### Peer Dependencies
- Version compatibility
- Missing peers
- Version conflicts

## Success Criteria
- All dependencies inventoried
- Security issues identified
- Update path is clear
- Optimization opportunities found
- Actionable recommendations provided

Analyze the project's dependencies and provide a comprehensive health report.