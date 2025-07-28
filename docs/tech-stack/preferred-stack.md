# Preferred Technology Stack

Default technology choices for new projects, with rationale for each selection.

## Core Language: TypeScript

TypeScript provides type safety and enhanced developer experience.

```typescript
// Type-safe interfaces improve code reliability
interface User {
    id: string;
    name: string;
    email: string;
    createdAt: Date;
}

// Generic functions with proper typing
function createEntity<T>(data: Omit<T, 'id' | 'createdAt'>): T {
    return {
        ...data,
        id: generateId(),
        createdAt: new Date()
    } as T;
}
```

### TypeScript Benefits
- Compile-time error detection
- Enhanced IDE support and refactoring
- Self-documenting code through types
- Better maintainability in large codebases
- Gradual adoption path from JavaScript

### TypeScript Configuration
```json
{
    "compilerOptions": {
        "strict": true,
        "target": "ES2020",
        "module": "commonjs",
        "lib": ["ES2020"],
        "outDir": "./dist",
        "rootDir": "./src",
        "resolveJsonModule": true,
        "esModuleInterop": true,
        "skipLibCheck": true,
        "forceConsistentCasingInFileNames": true
    }
}
```

## Runtime: Node.js

Node.js enables JavaScript execution on the server side with excellent ecosystem support.

```typescript
// Express server with TypeScript
import express from 'express';
import { Request, Response } from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/health', (req: Request, res: Response) => {
    res.json({ status: 'healthy', timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
```

### Node.js Benefits
- Large ecosystem of packages via npm
- Excellent performance for I/O operations
- Single language for frontend and backend
- Strong community and enterprise support
- Mature tooling and debugging capabilities

## Backend Framework: Express.js

Express.js provides a minimal, flexible web framework for building APIs and web applications.

```typescript
// Modular Express application structure
import express, { Application } from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { errorHandler } from './middleware/errorHandler';
import { userRoutes } from './routes/userRoutes';

class App {
    public app: Application;

    constructor() {
        this.app = express();
        this.setupMiddleware();
        this.setupRoutes();
        this.setupErrorHandling();
    }

    private setupMiddleware(): void {
        this.app.use(helmet());
        this.app.use(cors());
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: true }));
    }

    private setupRoutes(): void {
        this.app.use('/api/users', userRoutes);
    }

    private setupErrorHandling(): void {
        this.app.use(errorHandler);
    }
}

export default new App().app;
```

### Express.js Benefits
- Minimal and unopinionated framework
- Extensive middleware ecosystem
- Easy to test and mock
- Great performance characteristics
- Well-documented and mature

## Frontend Framework: React

React provides a component-based architecture for building user interfaces.

```typescript
// Functional React component with TypeScript
import React, { useState, useEffect } from 'react';

interface User {
    id: string;
    name: string;
    email: string;
}

interface UserListProps {
    initialUsers?: User[];
}

export const UserList: React.FC<UserListProps> = ({ initialUsers = [] }) => {
    const [users, setUsers] = useState<User[]>(initialUsers);
    const [loading, setLoading] = useState<boolean>(false);

    useEffect(() => {
        fetchUsers();
    }, []);

    const fetchUsers = async (): Promise<void> => {
        setLoading(true);
        try {
            const response = await fetch('/api/users');
            const userData = await response.json();
            setUsers(userData);
        } catch (error) {
            console.error('Failed to fetch users:', error);
        } finally {
            setLoading(false);
        }
    };

    if (loading) {
        return <div>Loading users...</div>;
    }

    return (
        <div className="user-list">
            {users.map(user => (
                <div key={user.id} className="user-card">
                    <h3>{user.name}</h3>
                    <p>{user.email}</p>
                </div>
            ))}
        </div>
    );
};
```

### React Benefits
- Component-based architecture promotes reusability
- Large ecosystem of libraries and tools
- Excellent developer tools and debugging
- Strong TypeScript integration
- Wide adoption and community support

## Package Manager: pnpm

pnpm provides efficient dependency management with hard links and strict dependency resolution.

```json
{
    "scripts": {
        "dev": "pnpm run build:watch & pnpm run start:dev",
        "build": "tsc",
        "build:watch": "tsc --watch",
        "start": "node dist/index.js",
        "start:dev": "nodemon dist/index.js",
        "test": "jest",
        "test:watch": "jest --watch",
        "lint": "eslint src/**/*.ts",
        "format": "prettier --write src/**/*.ts"
    },
    "dependencies": {
        "express": "^4.18.0",
        "@types/express": "^4.17.0"
    },
    "devDependencies": {
        "typescript": "^5.0.0",
        "nodemon": "^3.0.0",
        "jest": "^29.0.0",
        "@types/jest": "^29.0.0"
    }
}
```

### pnpm Benefits
- Faster installation times
- Efficient disk space usage through hard links
- Strict dependency resolution prevents phantom dependencies
- Excellent monorepo support
- Compatible with npm ecosystem

### pnpm Workspace Configuration
```yaml
# pnpm-workspace.yaml
packages:
  - 'packages/*'
  - 'apps/*'
```

## Database: PostgreSQL

PostgreSQL provides robust relational database capabilities with excellent TypeScript integration.

```typescript
// Database connection with TypeScript
import { Client } from 'pg';

interface DatabaseConfig {
    host: string;
    port: number;
    database: string;
    user: string;
    password: string;
}

class DatabaseConnection {
    private client: Client;

    constructor(config: DatabaseConfig) {
        this.client = new Client(config);
    }

    async connect(): Promise<void> {
        await this.client.connect();
    }

    async query<T>(sql: string, params: any[] = []): Promise<T[]> {
        const result = await this.client.query(sql, params);
        return result.rows;
    }

    async disconnect(): Promise<void> {
        await this.client.end();
    }
}

// Usage with type safety
interface User {
    id: number;
    name: string;
    email: string;
}

const users = await db.query<User>('SELECT * FROM users WHERE active = $1', [true]);
```

## Testing Framework: Jest

Jest provides comprehensive testing capabilities with excellent TypeScript support.

```typescript
// Jest test with TypeScript
import { UserService } from '../services/UserService';
import { DatabaseConnection } from '../database/DatabaseConnection';

describe('UserService', () => {
    let userService: UserService;
    let mockDb: jest.Mocked<DatabaseConnection>;

    beforeEach(() => {
        mockDb = {
            query: jest.fn(),
            connect: jest.fn(),
            disconnect: jest.fn()
        } as jest.Mocked<DatabaseConnection>;
        
        userService = new UserService(mockDb);
    });

    describe('createUser', () => {
        it('should create user with valid data', async () => {
            const userData = { name: 'John Doe', email: 'john@example.com' };
            const expectedUser = { id: 1, ...userData };
            
            mockDb.query.mockResolvedValue([expectedUser]);

            const result = await userService.createUser(userData);

            expect(result).toEqual(expectedUser);
            expect(mockDb.query).toHaveBeenCalledWith(
                'INSERT INTO users (name, email) VALUES ($1, $2) RETURNING *',
                [userData.name, userData.email]
            );
        });
    });
});
```

## Development Tools

### Essential Development Dependencies
```json
{
    "devDependencies": {
        "typescript": "^5.0.0",
        "ts-node": "^10.9.0",
        "nodemon": "^3.0.0",
        "@types/node": "^20.0.0",
        "jest": "^29.0.0",
        "ts-jest": "^29.0.0",
        "@types/jest": "^29.0.0",
        "eslint": "^8.0.0",
        "@typescript-eslint/eslint-plugin": "^6.0.0",
        "@typescript-eslint/parser": "^6.0.0",
        "prettier": "^3.0.0"
    }
}
```

### ESLint Configuration
```json
{
    "extends": [
        "@typescript-eslint/recommended",
        "prettier"
    ],
    "parser": "@typescript-eslint/parser",
    "plugins": ["@typescript-eslint"],
    "rules": {
        "@typescript-eslint/no-unused-vars": "error",
        "@typescript-eslint/explicit-function-return-type": "warn",
        "@typescript-eslint/no-explicit-any": "error"
    }
}
```

### Prettier Configuration
```json
{
    "semi": true,
    "trailingComma": "es5",
    "singleQuote": true,
    "printWidth": 100,
    "tabWidth": 4
}
```

## Project Structure

```
project-root/
├── src/
│   ├── controllers/     # Request handlers
│   ├── services/        # Business logic
│   ├── models/          # Data models and types
│   ├── middleware/      # Express middleware
│   ├── routes/          # API routes
│   ├── database/        # Database connection and queries
│   ├── utils/           # Utility functions
│   └── index.ts         # Application entry point
├── tests/
│   ├── unit/            # Unit tests
│   ├── integration/     # Integration tests
│   └── fixtures/        # Test data
├── dist/                # Compiled JavaScript
├── package.json
├── tsconfig.json
├── jest.config.js
├── .eslintrc.json
└── .prettierrc
```

## Alternative Considerations

### When to Consider Alternatives

**Framework Alternatives:**
- **Fastify** instead of Express for higher performance requirements
- **NestJS** for larger applications requiring more structure
- **Next.js** for full-stack React applications

**Database Alternatives:**
- **MongoDB** for document-based data models
- **Redis** for caching and session storage
- **SQLite** for development and testing

**Package Manager Alternatives:**
- **npm** for simpler setups or corporate environments
- **yarn** for teams already using it effectively

### Migration Considerations
When deviating from the preferred stack, document:
- Reasons for the alternative choice
- Migration path if returning to preferred stack
- Team training requirements
- Long-term maintenance implications