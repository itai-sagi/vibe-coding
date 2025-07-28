# Meaningful Naming Conventions

## Intention-Revealing Names

Names should reveal intent without requiring comments.

```typescript
let elapsedTimeInDays;
let customerData;
let userAccountInfo;
let temporaryFileName;
let isUserLoggedIn;
let totalAccountBalance;
```

## Meaningful Distinctions

Use specific, descriptive names that clearly differentiate purpose.

```typescript
function copyChars(source: string[], destination: string[]) { }
let productDetails;
let productStatistics;
let customerOrders;
let customerPreferences;
```

## Pronounceable Names

Choose names that can be easily spoken and discussed.

```typescript
let generationTimestamp;
let modificationTimestamp;
let configurationManager;
let databaseConnection;
```

## Searchable Names

Use descriptive names and named constants for better code navigation.

```typescript
const WORK_DAYS_PER_WEEK = 5;
const TASKS_PER_DAY = 4;
const MAX_RETRY_ATTEMPTS = 3;

for (let dayIndex = 0; dayIndex < numberOfDays; dayIndex++) {
    realDaysWorked += (taskEstimate[dayIndex] * TASKS_PER_DAY) / WORK_DAYS_PER_WEEK;
}

let userIndex, columnIndex, rowIndex;
let requestUrl, responseData;
let currentUser, activeSession;
```

## Class Names

Classes should have clear noun or noun phrase names.

```typescript
class Customer { }
class WikiPage { }
class Account { }
class AddressParser { }
class PaymentProcessor { }
class DatabaseConnection { }
class UserAuthentication { }
```

## Method Names

Methods should have verb or verb phrase names that clearly indicate their action.

```typescript
postPayment();
deletePage();
save();
calculateTotal();
validateInput();
processOrder();

// Accessors and Mutators
getName();
setName();
isPosted();
hasPermission();
canAccess();
```

## Consistent Vocabulary

Use the same word for the same concept throughout your codebase.

```typescript
// Always use 'get' for data retrieval
getUser();
getAccount();
getOrders();

// Always use 'controller' for this pattern
userController;
accountController;
orderController;
```

## Solution Domain Names

Use well-known computer science terms, algorithm names, and patterns.

```typescript
class JobQueue { }
class VisitorPattern { }
class ObserverPattern { }
class SingletonManager { }
let accountVisitor;
let commandProcessor;
let strategyHandler;
```

## Problem Domain Names

When no programming concept exists, use names from the business domain.

```typescript
class MortgageCalculator { }
class InsurancePolicy { }
class LoanApplication { }
let socialSecurityNumber;
let creditScore;
let insurancePremium;
```

## Meaningful Context

Provide clear context through well-named classes, functions, or namespaces.

```typescript
class Address {
    private firstName: string;
    private lastName: string;
    private street: string;
    private city: string;
    private state: string;
    private postalCode: string;
}

namespace UserAccount {
    let accountNumber: string;
    let accountType: string;
    let accountBalance: number;
}

// With prefixes when classes aren't appropriate
let userFirstName;
let userLastName;
let userEmailAddress;
```

## Context-Appropriate Length

Use appropriately sized names - shorter for smaller scopes, longer for larger scopes.

```typescript
// Short names for small scopes
for (let i = 0; i < items.length; i++) { }

// Descriptive names for larger scopes
class UserAuthenticationService { }
let authenticatedUserSession;
let databaseConnectionManager;
```