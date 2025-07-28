# Clean Code Principles

Based on Uncle Bob's Clean Code philosophy, adapted for AI coding agents.

## Core Principles

### Meaningful Names
- Use intention-revealing names for variables, functions, and classes
- Avoid misleading names and mental mapping
- Use searchable names and pronounceable names
- Pick one word per concept consistently

### Functions
- Keep functions small (preferably under 20 lines)
- Functions should do one thing only
- Use descriptive names that clearly indicate what the function does
- Minimize function arguments (ideally 0-2 parameters)
- Avoid side effects and output arguments
- Prefer exceptions over returning error codes

### Comments
- **Avoid comments in code** - Write self-documenting code instead
- Use meaningful variable and function names that explain intent
- Break complex logic into well-named functions
- **Only use comments when absolutely necessary** to explain complex business rules or algorithms
- **Never comment what the code does** - comment why it's done that way if needed
- Remove obsolete comments immediately when code changes

### Formatting
- Maintain consistent indentation and spacing
- Use vertical formatting to show conceptual relationships
- Keep lines reasonably short (under 120 characters)
- Group related functions together

### Objects and Data Structures
- Follow the Law of Demeter (don't talk to strangers)
- Hide internal structure and expose behavior through methods
- Prefer composition over inheritance
- Use dependency injection for loose coupling

### Error Handling
- Use exceptions rather than return codes
- Write try-catch blocks cleanly
- Provide context with exceptions
- Don't return or pass null values

## Files in This Section

- [naming.md](naming.md) - Detailed naming conventions and examples
- [functions.md](functions.md) - Function design principles and patterns
- [comments.md](comments.md) - When and how to use comments appropriately
- [formatting.md](formatting.md) - Code formatting and organization standards