# Vibe Coding - Best Practices for AI Agents

A comprehensive resource for AI coding agents to understand and implement high-quality software development practices.

## Purpose

This repository serves as a reference guide for AI agents to:
- Write clean, maintainable code following industry best practices
- Implement proper testing strategies with TDD approach
- Make informed technology choices and tool selections
- Follow established code review and quality standards
- Integrate modern development tools and workflows

## Repository Structure

```
├── README.md                    # This overview
├── docs/
│   ├── clean-code/              # Clean code principles and guidelines
│   │   ├── naming.md           # Meaningful naming conventions
│   │   ├── functions.md        # Function design principles
│   │   ├── comments.md         # When and how to comment code
│   │   └── formatting.md       # Code formatting standards
│   ├── testing/                 # Testing best practices
│   │   ├── tdd-approach.md     # Test-driven development guide
│   │   ├── test-types.md       # Unit, integration, e2e testing
│   │   ├── test-quality.md     # FIRST principles and quality standards
│   │   └── testing-strategies.md
│   ├── tech-stack/              # Technology preferences and selection
│   │   ├── preferred-stack.md   # Default technology choices
│   │   ├── selection-criteria.md # How to evaluate tools
│   │   └── research-process.md  # How to research before building
│   ├── development-workflow/    # Development processes and tools
│   │   ├── mcp-integration.md   # Model Context Protocol setup
│   │   ├── git-workflow.md      # Git best practices
│   │   └── code-review.md       # Review checklist and standards
│   └── documentation/           # Documentation standards
│       ├── mermaid-diagrams.md  # Using diagrams for complex workflows
│       ├── api-documentation.md # API documentation standards
│       └── project-docs.md      # Project documentation guidelines
├── examples/                    # Code examples and templates
│   ├── clean-code-examples/
│   ├── test-examples/
│   └── project-templates/
└── checklists/                  # Quick reference checklists
    ├── code-review-checklist.md
    ├── pre-commit-checklist.md
    └── project-setup-checklist.md
```

## Core Principles

### 1. Clean Code Philosophy
- Write self-documenting code with meaningful names
- Keep functions small and focused on single responsibilities
- Minimize comments by making code intention-revealing
- Follow consistent formatting and organization patterns

### 2. Test-Driven Development
- Write tests before implementation (Red-Green-Refactor)
- Focus on testing behaviors, not implementation details
- Ensure tests are Fast, Independent, Repeatable, Self-validating, and Timely

### 3. Research-First Approach
- Always research existing solutions before building from scratch
- Prefer well-adopted tools with active communities
- Evaluate multiple options based on stability, documentation, and compatibility

### 4. Preferred Technology Stack
- **Language**: TypeScript for type safety
- **Runtime**: Node.js for server-side execution
- **Backend**: Express.js for APIs
- **Frontend**: React for user interfaces
- **Package Manager**: pnpm for efficient dependency management

## Quick Start for AI Agents

1. **Before coding**: Read the clean code principles and understand the project's existing patterns
2. **Write tests first**: Follow TDD approach with failing tests before implementation
3. **Research tools**: Check existing solutions and evaluate options before building
4. **Follow conventions**: Mimic existing code style and use established libraries
5. **Document work**: Create mermaid diagrams for complex workflows and document decisions

## Key Resources

- [Clean Code Principles](docs/clean-code/) - Uncle Bob's clean code guidelines adapted for AI agents
- [Testing Guidelines](docs/testing/) - Comprehensive testing strategies and TDD approach
- [Tech Stack Guide](docs/tech-stack/) - Technology preferences and selection criteria
- [MCP Integration](docs/development-workflow/mcp-integration.md) - Setting up Model Context Protocol servers
- [Code Review Checklist](checklists/code-review-checklist.md) - Quality standards verification

## For Human Developers

This repository can also serve as a reference for human developers who want to understand the coding standards and practices that AI agents should follow when working on their projects.

## Contributing

This is a living document that should evolve with industry best practices. Updates should reflect:
- New coding standards or methodologies
- Technology preference changes
- Lessons learned from real-world projects
- Community feedback and improvements