# Code Review Checklist

Use this checklist to ensure code quality and consistency before merging.

## Functionality ✓

- [ ] Code accomplishes its intended purpose
- [ ] All edge cases are handled appropriately  
- [ ] Error handling is comprehensive and informative
- [ ] Input validation is present where needed
- [ ] Return values are appropriate and consistent

## Clean Code Compliance ✓

### Naming
- [ ] Variable names reveal intent clearly
- [ ] Function names describe what they do
- [ ] Class names are descriptive nouns
- [ ] Naming is consistent throughout the codebase
- [ ] Names are pronounceable and searchable

### Functions
- [ ] Functions are small (preferably under 20 lines)
- [ ] Each function has a single responsibility
- [ ] Function parameters are minimal (0-2 ideally)
- [ ] No side effects in pure functions
- [ ] Function names clearly indicate their purpose

### Code Structure
- [ ] Code is self-documenting
- [ ] Complex logic is broken into well-named functions
- [ ] Related code is grouped together
- [ ] Consistent formatting and indentation
- [ ] No dead or commented-out code

## Testing ✓

### Test Coverage
- [ ] Tests focus on behaviors and contracts
- [ ] Edge cases are covered
- [ ] Error conditions are tested
- [ ] All new functionality has tests
- [ ] Tests are isolated and independent

### Test Quality
- [ ] Tests are readable and maintainable
- [ ] Test names describe what they verify
- [ ] Tests are fast and reliable
- [ ] No testing implementation details
- [ ] Proper use of mocking and stubbing

## Design ✓

### Architecture
- [ ] Code follows established patterns in the codebase
- [ ] Dependencies are properly injected
- [ ] Classes and modules have single responsibilities
- [ ] Appropriate separation of concerns
- [ ] Follows SOLID principles where applicable

### Maintainability
- [ ] Code is extensible for future changes
- [ ] No code duplication
- [ ] Appropriate abstraction levels
- [ ] Clear interfaces and contracts
- [ ] Proper error boundaries

## TypeScript Specific ✓

- [ ] Proper type definitions for all functions
- [ ] No use of `any` type unless absolutely necessary
- [ ] Interfaces defined for complex data structures
- [ ] Strict mode compliance
- [ ] Proper handling of nullable values

## Security ✓

- [ ] No hardcoded secrets or credentials
- [ ] Input sanitization where needed
- [ ] Proper authentication and authorization
- [ ] No sensitive data in logs
- [ ] Following security best practices

## Performance ✓

- [ ] No obvious performance bottlenecks
- [ ] Appropriate data structures chosen
- [ ] Database queries are optimized
- [ ] No unnecessary computations in loops
- [ ] Proper memory management

## Documentation ✓

- [ ] Complex workflows have mermaid diagrams
- [ ] API changes are documented
- [ ] README updated if needed
- [ ] Architecture decisions are explained
- [ ] Public interfaces are documented

## Integration ✓

- [ ] Code integrates well with existing systems
- [ ] Follows established coding conventions
- [ ] Uses existing libraries and utilities
- [ ] Proper error handling integration
- [ ] Consistent with team practices

## Pre-Merge Requirements ✓

- [ ] All tests pass
- [ ] Linting passes without errors
- [ ] Type checking passes
- [ ] No merge conflicts
- [ ] Branch is up to date with main

## Review Process ✓

- [ ] Changes are atomic and focused
- [ ] Commit messages are clear and descriptive
- [ ] Pull request description explains the changes
- [ ] Screenshots included for UI changes
- [ ] Breaking changes are clearly marked

---

## Reviewer Notes

**What to Focus On:**
- Business logic correctness
- Code maintainability and readability
- Test coverage and quality
- Adherence to team standards
- Security implications

**What to Provide:**
- Specific, actionable feedback
- Code suggestions where appropriate
- Recognition of good practices
- Questions about unclear logic
- Recommendations for improvements