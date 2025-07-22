---
description: Generate comprehensive documentation for code
argument-hint: [file path, module, or API]
allowed-tools: Read, Write, Glob, Grep
---

# Generate Documentation

You are generating clear, comprehensive documentation for code to help developers understand and use it effectively.

## Input
**Documentation Target**: $ARGUMENTS (file, class, module, or API)

## Your Task

Generate appropriate documentation based on the code type:

1. **Analyze the Code** - Understand structure and purpose
2. **Extract Information** - Gather all relevant details
3. **Generate Documentation** - Create clear, useful docs
4. **Include Examples** - Provide practical usage examples

## Documentation Types

### API Documentation
```markdown
# API Documentation: [API Name]

## Overview
[Brief description of the API's purpose]

## Base URL
```
[https://api.example.com/v1]
```

## Authentication
[Authentication method and requirements]

## Endpoints

### [HTTP Method] /[endpoint]
[Endpoint description]

**Parameters**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| [param] | [type] | Yes/No | [description] |

**Request Example**
```json
{
  "field": "value"
}
```

**Response Example**
```json
{
  "status": "success",
  "data": {}
}
```

**Status Codes**
- `200` - Success
- `400` - Bad Request
- `401` - Unauthorized

**Error Response**
```json
{
  "error": "Error message"
}
```
```

### Function/Method Documentation
```[language]
/**
 * [Brief description of what the function does]
 * 
 * @param {Type} paramName - [Parameter description]
 * @param {Type} [optionalParam] - [Optional parameter description]
 * @returns {Type} [Description of return value]
 * @throws {ErrorType} [When this error is thrown]
 * 
 * @example
 * // Example usage
 * const result = functionName(param1, param2);
 * console.log(result); // Expected output
 * 
 * @see [Related function or documentation]
 * @since [Version when added]
 */
```

### Class Documentation
```[language]
/**
 * [Class description]
 * 
 * @class ClassName
 * @extends {ParentClass}
 * @implements {Interface}
 * 
 * @example
 * const instance = new ClassName(options);
 * instance.method();
 */
class ClassName {
  /**
   * Creates an instance of ClassName
   * @param {Object} options - Configuration options
   * @param {Type} options.field - [Field description]
   */
  constructor(options) {}
  
  /**
   * [Method description]
   * @param {Type} param - [Parameter description]
   * @returns {Type} [Return description]
   */
  method(param) {}
}
```

### Module Documentation
```markdown
# Module: [Module Name]

## Description
[What this module does and why it exists]

## Installation
```bash
npm install [module-name]
```

## Quick Start
```[language]
import { feature } from '[module-name]';

// Basic usage
feature.doSomething();
```

## API Reference

### Functions
- [`functionName(params)`](#functionname) - [Brief description]
- [`anotherFunction()`](#anotherfunction) - [Brief description]

### Classes
- [`ClassName`](#classname) - [Brief description]

### Constants
- `CONSTANT_NAME` - [Description]

## Examples

### [Example Name]
[Example description]
```[language]
[Example code]
```

## Configuration
[Configuration options and defaults]

## Troubleshooting
[Common issues and solutions]
```

### README Documentation
```markdown
# [Project Name]

[Brief description - what it does and why it's useful]

## Features
- ✨ [Feature 1]
- 🚀 [Feature 2]
- 💪 [Feature 3]

## Installation
```bash
[Installation commands]
```

## Usage
```[language]
[Basic usage example]
```

## API
[Link to detailed API docs or brief overview]

## Development
```bash
# Clone the repository
git clone [repo-url]

# Install dependencies
npm install

# Run tests
npm test

# Build
npm run build
```

## Contributing
[Contribution guidelines]

## License
[License information]
```

## Documentation Components

### Essential Sections
- **Overview**: What and why
- **Installation**: How to set up
- **Quick Start**: Minimal working example
- **API Reference**: Detailed documentation
- **Examples**: Real-world usage
- **Configuration**: Options and settings
- **Troubleshooting**: Common issues

### Code Examples
- **Basic Usage**: Simple, common use case
- **Advanced Usage**: Complex scenarios
- **Error Handling**: How to handle errors
- **Edge Cases**: Unusual situations
- **Integration**: Using with other tools

### Best Practices
- **Clear Language**: Avoid jargon
- **Consistent Format**: Same structure throughout
- **Practical Examples**: Real, runnable code
- **Visual Aids**: Diagrams when helpful
- **Version Info**: Note version requirements
- **Cross-References**: Link related docs

## Output Format

```markdown
# 📚 Generated Documentation

## Documentation Type
[API/Function/Class/Module/README]

## Generated Files

### [filename.md]
[Preview of generated documentation]

## Suggested Improvements
- [ ] Add more examples for [feature]
- [ ] Document error scenarios
- [ ] Include performance notes
- [ ] Add migration guide

## Integration
Place documentation at:
- API Docs: `docs/api/[name].md`
- README: Project root
- Inline: Within source files
- Wiki: Project wiki pages
```

## Success Criteria
- Documentation is complete and accurate
- Examples are practical and runnable
- All parameters/methods are documented
- Edge cases are covered
- Format follows project conventions

Generate comprehensive documentation for the specified code target.