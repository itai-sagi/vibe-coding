# Function Design Principles

Functions should be small, focused, and have descriptive names that clearly indicate their purpose.

## Small Functions

Keep functions small and focused on a single task.

```typescript
// Well-sized function with single responsibility
function calculateTotalPrice(items: CartItem[]): number {
    return items.reduce((total, item) => total + calculateItemPrice(item), 0);
}

function calculateItemPrice(item: CartItem): number {
    return item.price * item.quantity;
}

function applyDiscount(total: number, discountPercentage: number): number {
    return total * (1 - discountPercentage / 100);
}
```

## Descriptive Function Names

Function names should clearly describe what the function does using verbs or verb phrases.

```typescript
// Clear, descriptive function names
function validateUserEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function formatCurrency(amount: number, currency: string = 'USD'): string {
    return new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: currency
    }).format(amount);
}

function generateUniqueId(): string {
    return Date.now().toString(36) + Math.random().toString(36).substr(2);
}
```

## Minimize Function Arguments

Functions should have few parameters, ideally 0-2. Use objects for multiple related parameters.

```typescript
// Minimal parameters using object destructuring
interface UserCreationData {
    name: string;
    email: string;
    role: UserRole;
    department: string;
}

function createUser({ name, email, role, department }: UserCreationData): User {
    return {
        id: generateUniqueId(),
        name,
        email,
        role,
        department,
        createdAt: new Date(),
        isActive: true
    };
}

// Function with single responsibility and minimal parameters
function sendWelcomeEmail(user: User): Promise<void> {
    return emailService.send({
        to: user.email,
        template: 'welcome',
        data: { userName: user.name }
    });
}
```

## Pure Functions

Prefer pure functions that don't have side effects and always return the same output for the same input.

```typescript
// Pure functions - predictable and testable
function calculateAge(birthDate: Date): number {
    const today = new Date();
    const age = today.getFullYear() - birthDate.getFullYear();
    const monthDiff = today.getMonth() - birthDate.getMonth();
    
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
        return age - 1;
    }
    
    return age;
}

function formatFullName(firstName: string, lastName: string): string {
    return `${firstName} ${lastName}`.trim();
}

function calculateCompoundInterest(
    principal: number, 
    rate: number, 
    time: number, 
    compoundFrequency: number = 1
): number {
    return principal * Math.pow(1 + rate / compoundFrequency, compoundFrequency * time);
}
```

## Function Composition

Break complex operations into smaller, composable functions.

```typescript
// Composable functions for data processing
function filterActiveUsers(users: User[]): User[] {
    return users.filter(user => user.isActive);
}

function sortUsersByName(users: User[]): User[] {
    return [...users].sort((a, b) => a.name.localeCompare(b.name));
}

function mapUsersToSummary(users: User[]): UserSummary[] {
    return users.map(user => ({
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role
    }));
}

// Compose functions to create data pipeline
function getActiveUserSummaries(users: User[]): UserSummary[] {
    return mapUsersToSummary(
        sortUsersByName(
            filterActiveUsers(users)
        )
    );
}
```

## Error Handling

Use proper error handling with meaningful error messages.

```typescript
// Error handling with specific error types
class ValidationError extends Error {
    constructor(message: string) {
        super(message);
        this.name = 'ValidationError';
    }
}

class DatabaseError extends Error {
    constructor(message: string, public readonly cause?: Error) {
        super(message);
        this.name = 'DatabaseError';
    }
}

function validateAndCreateUser(userData: UserCreationData): User {
    if (!userData.name.trim()) {
        throw new ValidationError('User name is required');
    }
    
    if (!validateUserEmail(userData.email)) {
        throw new ValidationError('Invalid email format');
    }
    
    return createUser(userData);
}

async function saveUserToDatabase(user: User): Promise<User> {
    try {
        const savedUser = await database.users.create(user);
        return savedUser;
    } catch (error) {
        throw new DatabaseError('Failed to save user to database', error);
    }
}
```

## Async Function Patterns

Handle asynchronous operations properly with clear error handling.

```typescript
// Proper async function implementation
async function processUserRegistration(userData: UserCreationData): Promise<User> {
    try {
        const user = validateAndCreateUser(userData);
        const savedUser = await saveUserToDatabase(user);
        await sendWelcomeEmail(savedUser);
        return savedUser;
    } catch (error) {
        console.error('User registration failed:', error);
        throw error;
    }
}

// Concurrent operations with Promise.all
async function getUsersWithProfiles(userIds: string[]): Promise<UserWithProfile[]> {
    const [users, profiles] = await Promise.all([
        fetchUsers(userIds),
        fetchUserProfiles(userIds)
    ]);
    
    return users.map(user => ({
        ...user,
        profile: profiles.find(profile => profile.userId === user.id)
    }));
}

// Retry logic for resilient operations
async function fetchWithRetry<T>(
    operation: () => Promise<T>,
    maxRetries: number = 3,
    delay: number = 1000
): Promise<T> {
    for (let attempt = 1; attempt <= maxRetries; attempt++) {
        try {
            return await operation();
        } catch (error) {
            if (attempt === maxRetries) {
                throw error;
            }
            await new Promise(resolve => setTimeout(resolve, delay * attempt));
        }
    }
    throw new Error('Retry attempts exhausted');
}
```

## Higher-Order Functions

Use higher-order functions for reusable patterns and function composition.

```typescript
// Higher-order functions for common patterns
function withLogging<T extends any[], R>(
    fn: (...args: T) => R,
    functionName: string
): (...args: T) => R {
    return (...args: T): R => {
        console.log(`Calling ${functionName} with args:`, args);
        const result = fn(...args);
        console.log(`${functionName} returned:`, result);
        return result;
    };
}

function withCaching<T extends any[], R>(
    fn: (...args: T) => R,
    keyGenerator: (...args: T) => string
): (...args: T) => R {
    const cache = new Map<string, R>();
    
    return (...args: T): R => {
        const key = keyGenerator(...args);
        if (cache.has(key)) {
            return cache.get(key)!;
        }
        
        const result = fn(...args);
        cache.set(key, result);
        return result;
    };
}

// Usage of higher-order functions
const loggedCalculateTotal = withLogging(calculateTotalPrice, 'calculateTotalPrice');

const cachedExpensiveCalculation = withCaching(
    expensiveCalculation,
    (input: string) => `calc_${input}`
);
```

## Function Organization

Organize functions logically within modules and classes.

```typescript
// Service class with well-organized methods
class UserService {
    constructor(
        private readonly userRepository: UserRepository,
        private readonly emailService: EmailService
    ) {}

    // Public interface methods
    async createUser(userData: UserCreationData): Promise<User> {
        const user = this.validateAndBuildUser(userData);
        const savedUser = await this.userRepository.save(user);
        await this.sendWelcomeNotification(savedUser);
        return savedUser;
    }

    async getUserById(id: string): Promise<User | null> {
        return this.userRepository.findById(id);
    }

    async updateUser(id: string, updates: Partial<UserUpdateData>): Promise<User> {
        const existingUser = await this.getUserById(id);
        if (!existingUser) {
            throw new Error('User not found');
        }
        
        const updatedUser = this.mergeUserUpdates(existingUser, updates);
        return this.userRepository.save(updatedUser);
    }

    // Private helper methods
    private validateAndBuildUser(userData: UserCreationData): User {
        this.validateUserData(userData);
        return this.buildUserFromData(userData);
    }

    private validateUserData(userData: UserCreationData): void {
        if (!userData.name.trim()) {
            throw new ValidationError('Name is required');
        }
        if (!validateUserEmail(userData.email)) {
            throw new ValidationError('Invalid email format');
        }
    }

    private buildUserFromData(userData: UserCreationData): User {
        return {
            id: generateUniqueId(),
            ...userData,
            createdAt: new Date(),
            isActive: true
        };
    }

    private mergeUserUpdates(existingUser: User, updates: Partial<UserUpdateData>): User {
        return {
            ...existingUser,
            ...updates,
            updatedAt: new Date()
        };
    }

    private async sendWelcomeNotification(user: User): Promise<void> {
        await this.emailService.sendWelcomeEmail(user.email, user.name);
    }
}
```

## Type-Safe Function Interfaces

Use TypeScript interfaces and generics for type-safe function definitions.

```typescript
// Generic utility functions with type safety
function mapArray<T, U>(array: T[], mapper: (item: T) => U): U[] {
    return array.map(mapper);
}

function filterArray<T>(array: T[], predicate: (item: T) => boolean): T[] {
    return array.filter(predicate);
}

function reduceArray<T, U>(
    array: T[], 
    reducer: (accumulator: U, current: T) => U, 
    initialValue: U
): U {
    return array.reduce(reducer, initialValue);
}

// Function type definitions for callbacks
type ValidationFunction<T> = (value: T) => boolean;
type TransformFunction<T, U> = (value: T) => U;
type AsyncOperation<T> = () => Promise<T>;

// Using function types in interfaces
interface DataProcessor<T> {
    validate: ValidationFunction<T>;
    transform: TransformFunction<T, string>;
    process: (data: T[]) => Promise<string[]>;
}
```