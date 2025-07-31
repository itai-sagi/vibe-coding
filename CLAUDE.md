# AI Coding Best Practices Repository

This repository contains comprehensive guidelines and best practices for AI-assisted coding. When working in this repository, follow these instructions to maintain high code quality and consistency.

## Repository Overview

This repository serves as a reference for clean code practices, development workflows, and AI-assisted coding patterns. It includes:

- Clean code principles based on Uncle Bob's Clean Code
- Code review checklists
- Development workflow documentation
- Testing approaches (TDD)
- Preferred technology stack guidelines

## Core Principles

### Clean Code Philosophy

@docs/clean-code/README.md
@docs/clean-code/naming.md
@docs/clean-code/functions.md
@docs/clean-code/comments.md

**Key principles to follow:**
- Write self-documenting code with meaningful names
- Keep functions small and focused on a single responsibility
- Avoid comments by writing clear, expressive code
- Maintain consistent formatting and structure

### Code Review Standards

@checklists/code-review-checklist.md

Focus on:
- Code clarity and readability
- Adherence to clean code principles
- Test coverage and quality
- Performance considerations
- Security best practices

### Development Workflow

@docs/development-workflow/mcp-integration.md

### Testing Approach

@docs/testing/tdd-approach.md

Use examples from `examples/test-examples/` as reference.

### Technology Stack

@docs/tech-stack/preferred-stack.md

**Important Technology Guidelines:**
- Always prioritize the project's existing technology stack before defaulting to preferred technologies
- Research and understand what technologies are already in use in the current project
- Ask for permission before introducing new technologies that require infrastructure changes
- When suggesting new tools or frameworks, explain why they're needed and what infrastructure impact they may have
- Prefer extending existing technology choices over introducing new ones unless there's a compelling reason

## Project Structure

When creating new files or directories:
- Follow the existing structure patterns
- Place documentation in `docs/`
- Add examples to `examples/`
- Keep checklists in `checklists/`

## Working with Examples

The `examples/` directory contains:
- `clean-code-examples/` - Demonstrations of clean code principles
- `project-templates/` - Starter templates for new projects
- `test-examples/` - Testing patterns and examples

Use these as reference when implementing new features or creating new projects.

## Continuous Improvement

This repository is meant to evolve. When you discover new best practices or improvements:
- Update the relevant documentation
- Add examples to demonstrate the practice
- Ensure consistency with existing principles

## Quick Reference Commands

When working on code in this repository:
- Always check relevant documentation before implementing
- Use the code review checklist for all changes
- Reference examples for implementation patterns
- Follow TDD practices for new features