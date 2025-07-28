# Model Context Protocol (MCP) Integration

MCP enables AI agents to securely connect to external data sources and tools. This guide shows how to set up and use MCP servers effectively.

## What is MCP?

Model Context Protocol is an open standard by Anthropic that provides:
- Secure connections between AI assistants and external services
- Unified protocol replacing fragmented integrations
- Standardized way to access databases, APIs, and development tools

## Recommended MCP Servers

### GitHub Server
Perfect for repository operations and issue management.

```bash
# Install GitHub MCP server
claude mcp add github

# Use OAuth authentication
/mcp
```

**Use cases:**
- Create and manage issues
- Review pull requests
- Access repository information
- Manage project boards

### Database Servers

```bash
# PostgreSQL
claude mcp add postgresql --connection-string "postgresql://user:pass@localhost/db"

# MySQL
claude mcp add mysql --connection-string "mysql://user:pass@localhost/db"
```

**Use cases:**
- Schema exploration and documentation
- Query execution and optimization
- Database migration assistance
- Data analysis and reporting

### Filesystem Server

```bash
claude mcp add filesystem --path "/path/to/project"
```

**Use cases:**
- Advanced file operations
- Directory tree analysis
- File content searching
- Batch file operations

### Slack Integration

```bash
claude mcp add slack
```

**Use cases:**
- Team communication
- Status updates
- Notification management
- Channel monitoring

## Configuration Examples

### Claude Desktop Configuration

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
      }
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "POSTGRES_CONNECTION_STRING": "postgresql://localhost/mydb"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem"],
      "env": {
        "ALLOWED_DIRECTORIES": ["/Users/username/projects"]
      }
    }
  }
}
```

### Project-Specific MCP Setup

```json
{
  "mcpServers": {
    "project-db": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "POSTGRES_CONNECTION_STRING": "postgresql://localhost/project_db"
      }
    },
    "project-files": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem"],
      "env": {
        "ALLOWED_DIRECTORIES": ["/path/to/this/project"]
      }
    }
  }
}
```

## Setup Workflow

### 1. Initial Setup
```bash
# List available servers
claude mcp list

# Add new server
claude mcp add <server-name>

# Verify configuration
claude mcp status
```

### 2. Authentication
```bash
# For OAuth-based servers (GitHub, Slack)
/mcp

# For connection string-based servers (databases)
# Add credentials to environment or config file
```

### 3. Testing Integration
```typescript
// Example: Test database connection
async function testDatabaseConnection() {
    const result = await queryDatabase('SELECT version()');
    console.log('Database connected:', result);
}

// Example: Test GitHub integration
async function testGitHubIntegration() {
    const issues = await listGitHubIssues('owner/repo');
    console.log('Found issues:', issues.length);
}
```

## Best Practices

### Security
- Use environment variables for sensitive credentials
- Scope MCP servers appropriately (project vs user level)
- Regularly rotate access tokens
- Use read-only permissions when write access isn't needed

### Organization
- Use project-specific MCP configurations for team resources
- Document which MCP servers are required for each project
- Keep MCP server list minimal and relevant
- Use descriptive names for MCP server configurations

### Performance
- Choose the most specific MCP server for your needs
- Configure appropriate timeouts and limits
- Monitor MCP server resource usage
- Cache frequently accessed data when possible

## Integration with Development Workflow

### Database Schema Documentation
```mermaid
graph LR
    A[MCP Database Server] --> B[Schema Exploration]
    B --> C[Generate Documentation]
    C --> D[Update Project Docs]
    D --> E[Team Review]
```

### Issue Management Workflow
```mermaid
graph TD
    A[Code Issue Detected] --> B[Create GitHub Issue via MCP]
    B --> C[Link to Pull Request]
    C --> D[Update Issue Status]
    D --> E[Close on Merge]
```

### File Operations Pipeline
```mermaid
graph LR
    A[File Analysis Request] --> B[MCP Filesystem Server]
    B --> C[Directory Scanning]
    C --> D[Content Analysis]
    D --> E[Generate Report]
```

## Common Integration Patterns

### Database-Driven Development
```typescript
// Use MCP to explore schema, then generate types
interface User {
    id: number;
    email: string;
    createdAt: Date;
}

// Generate based on actual database schema via MCP
```

### GitHub-Integrated Workflow
```typescript
// Create issues from code analysis
async function createIssueFromTodo(todo: string, file: string) {
    await createGitHubIssue({
        title: `TODO: ${todo}`,
        body: `Found in ${file}`,
        labels: ['enhancement', 'todo']
    });
}
```

### File System Analysis
```typescript
// Analyze project structure
async function analyzeProjectStructure() {
    const files = await scanDirectory('./src');
    const analysis = analyzeCodePatterns(files);
    return generateArchitectureDocument(analysis);
}
```

## Troubleshooting

### Connection Issues
- Verify MCP server is properly installed
- Check environment variables and credentials
- Confirm network connectivity
- Review Claude Desktop logs

### Performance Issues
- Limit query scope and complexity
- Use appropriate timeouts
- Monitor resource usage
- Consider caching strategies

### Authentication Problems
- Refresh OAuth tokens
- Verify permission scopes
- Check API rate limits
- Confirm server configuration

## Resources

- [Official MCP Documentation](https://docs.anthropic.com/en/docs/claude-code/mcp)
- [MCP Server Registry](https://github.com/modelcontextprotocol/servers)
- [Community Examples](https://modelcontextprotocol.io/introduction)