# Comments: When and How to Use Them

The best code is self-documenting. Use comments sparingly and only when absolutely necessary.

## Write Self-Documenting Code First

Make your code so clear that comments become unnecessary.

```typescript
// Self-documenting code with meaningful names
function calculateMonthlyPayment(
    loanAmount: number,
    annualInterestRate: number,
    loanTermInYears: number
): number {
    const monthlyInterestRate = annualInterestRate / 12 / 100;
    const numberOfPayments = loanTermInYears * 12;
    
    if (monthlyInterestRate === 0) {
        return loanAmount / numberOfPayments;
    }
    
    const monthlyPayment = loanAmount * 
        (monthlyInterestRate * Math.pow(1 + monthlyInterestRate, numberOfPayments)) /
        (Math.pow(1 + monthlyInterestRate, numberOfPayments) - 1);
    
    return Math.round(monthlyPayment * 100) / 100;
}
```

## Break Complex Logic into Named Functions

Instead of commenting what code does, extract it into well-named functions.

```typescript
// Extract complex logic into descriptive functions
function processUserOrderPayment(order: Order, paymentMethod: PaymentMethod): PaymentResult {
    if (isOrderEligibleForProcessing(order)) {
        const adjustedTotal = calculateTotalWithTaxAndShipping(order);
        return processPaymentWithRetry(adjustedTotal, paymentMethod);
    }
    
    throw new Error('Order is not eligible for payment processing');
}

function isOrderEligibleForProcessing(order: Order): boolean {
    return order.status === 'confirmed' && 
           order.items.length > 0 && 
           order.shippingAddress !== null;
}

function calculateTotalWithTaxAndShipping(order: Order): number {
    const subtotal = order.items.reduce((sum, item) => sum + item.price * item.quantity, 0);
    const tax = subtotal * order.taxRate;
    const shipping = calculateShippingCost(order.shippingAddress, order.weight);
    
    return subtotal + tax + shipping;
}
```

## Use Meaningful Variable Names

Replace comments explaining variables with descriptive variable names.

```typescript
// Descriptive variable names eliminate need for comments
function analyzeWebsitePerformance(metrics: PerformanceMetrics): PerformanceReport {
    const averagePageLoadTimeInSeconds = metrics.totalLoadTime / metrics.pageViews;
    const bounceRatePercentage = (metrics.singlePageSessions / metrics.totalSessions) * 100;
    const conversionRatePercentage = (metrics.conversions / metrics.visitors) * 100;
    
    const isPerformanceOptimal = averagePageLoadTimeInSeconds < 3 && 
                                bounceRatePercentage < 40 && 
                                conversionRatePercentage > 2;
    
    return {
        loadTime: averagePageLoadTimeInSeconds,
        bounceRate: bounceRatePercentage,
        conversionRate: conversionRatePercentage,
        isOptimal: isPerformanceOptimal,
        recommendations: generatePerformanceRecommendations(metrics)
    };
}
```

## When Comments Are Appropriate

Use comments only in these specific situations:

### Legal and Copyright Information
```typescript
/**
 * Copyright (c) 2024 Company Name
 * Licensed under MIT License
 * 
 * This module handles payment processing for e-commerce transactions
 */
```

### Complex Business Rules
```typescript
function calculateLoyaltyPoints(purchase: Purchase, customer: Customer): number {
    // Business Rule: Premium customers earn 2x points during promotional periods
    // Promotional periods are defined as Black Friday through Cyber Monday
    // This multiplier stacks with category-specific bonuses
    const isPromotionalPeriod = isWithinBlackFridayWeek(purchase.date);
    const baseMultiplier = customer.isPremium && isPromotionalPeriod ? 2 : 1;
    
    return calculateBasePoints(purchase) * baseMultiplier * getCategoryMultiplier(purchase.category);
}
```

### Algorithm Explanations
```typescript
function quickSort<T>(array: T[], compareFn: (a: T, b: T) => number): T[] {
    if (array.length <= 1) {
        return array;
    }
    
    // Choose middle element as pivot to avoid worst-case O(n²) performance
    // on already sorted arrays
    const pivotIndex = Math.floor(array.length / 2);
    const pivot = array[pivotIndex];
    
    const less = array.filter((item, index) => index !== pivotIndex && compareFn(item, pivot) < 0);
    const greater = array.filter((item, index) => index !== pivotIndex && compareFn(item, pivot) >= 0);
    
    return [...quickSort(less, compareFn), pivot, ...quickSort(greater, compareFn)];
}
```

### API Documentation
```typescript
/**
 * Processes a payment transaction with automatic retry logic
 * 
 * @param amount - Payment amount in cents (e.g., 2000 for $20.00)
 * @param paymentMethod - Payment method details including type and credentials
 * @param options - Processing options including retry settings and timeout
 * @returns Promise resolving to payment result with transaction ID and status
 * 
 * @throws {ValidationError} When payment amount is invalid or payment method is malformed
 * @throws {PaymentError} When payment processing fails after all retries
 * 
 * @example
 * ```typescript
 * const result = await processPayment(2000, creditCard, { maxRetries: 3 });
 * console.log(result.transactionId);
 * ```
 */
async function processPayment(
    amount: number,
    paymentMethod: PaymentMethod,
    options: PaymentOptions = {}
): Promise<PaymentResult> {
    validatePaymentAmount(amount);
    validatePaymentMethod(paymentMethod);
    
    return executePaymentWithRetry(amount, paymentMethod, options);
}
```

### Warning About Unusual Code
```typescript
function optimizedStringConcatenation(strings: string[]): string {
    // Performance optimization: Array.join() is significantly faster than
    // repeated string concatenation for large arrays (10x improvement with 1000+ items)
    // This matters for report generation where we process thousands of entries
    return strings.join('');
}

function handleLegacyApiResponse(response: any): User[] {
    // WARNING: Legacy API returns inconsistent data structure
    // Sometimes users are in 'data.users', sometimes in 'users', sometimes in 'data'
    // This will be removed when API v3 migration is complete (target: Q2 2024)
    const userData = response.data?.users || response.users || response.data || [];
    return Array.isArray(userData) ? userData.map(normalizeUserData) : [userData];
}
```

## Comments to Avoid

### Commenting Obvious Code
```typescript
// Self-explanatory code doesn't need comments
function getUserFullName(user: User): string {
    return `${user.firstName} ${user.lastName}`.trim();
}

function isUserActive(user: User): boolean {
    return user.status === 'active' && user.lastLoginDate > getThirtyDaysAgo();
}
```

### Explaining What Code Does
```typescript
// Code should be self-explanatory about what it does
function calculateOrderTotal(order: Order): number {
    const subtotal = order.items.reduce(sumItemPrices, 0);
    const tax = subtotal * order.taxRate;
    const shipping = calculateShipping(order.weight, order.destination);
    
    return subtotal + tax + shipping;
}

function sumItemPrices(total: number, item: OrderItem): number {
    return total + (item.price * item.quantity);
}
```

### Journaling and Attribution
```typescript
// Code history belongs in version control, not in comments
function processOrder(order: Order): ProcessedOrder {
    validateOrderItems(order.items);
    
    const processedOrder = {
        ...order,
        processedAt: new Date(),
        status: 'processed'
    };
    
    return processedOrder;
}
```

## Comment Maintenance

### Keep Comments Current
```typescript
function calculateShippingCost(weight: number, destination: string): number {
    // Updated rates effective January 2024 - sync with shipping provider API
    const baseRate = getBaseShippingRate(destination);
    const weightMultiplier = Math.ceil(weight / 0.5) * 0.5; // Round up to nearest 0.5kg
    
    return baseRate * weightMultiplier;
}
```

### Remove Outdated Comments
```typescript
// Clean code without outdated comments
function authenticateUser(credentials: LoginCredentials): Promise<AuthResult> {
    return validateCredentials(credentials)
        .then(encryptSession)
        .then(generateTokens)
        .catch(handleAuthenticationError);
}
```

## Documentation Comments for Public APIs

Use JSDoc format for public interfaces and APIs.

```typescript
/**
 * Configuration options for the email service
 */
interface EmailServiceConfig {
    /** SMTP server hostname */
    host: string;
    /** SMTP server port (usually 587 for TLS) */
    port: number;
    /** Whether to use TLS encryption */
    secure: boolean;
    /** Authentication credentials */
    auth: {
        user: string;
        pass: string;
    };
}

/**
 * Email service for sending transactional emails
 */
class EmailService {
    /**
     * Sends an email using the configured SMTP settings
     * 
     * @param to - Recipient email address
     * @param subject - Email subject line
     * @param content - Email content (HTML or plain text)
     * @returns Promise that resolves when email is sent successfully
     */
    async sendEmail(to: string, subject: string, content: string): Promise<void> {
        await this.validateEmailAddress(to);
        await this.sendViaSmtp({ to, subject, content });
    }
}
```

## Comment Style Guidelines

### Use Consistent Formatting
```typescript
/**
 * Multi-line comment for complex explanations
 * Use this format for detailed documentation
 * that spans multiple lines
 */

// Single-line comment for brief explanations
// Use this format for short clarifications

/* 
 * Block comment style - avoid this format
 * It's harder to maintain and less common in TypeScript
 */
```

### Write Clear, Concise Comments
```typescript
// Business requirement: Premium users get free shipping on orders over $100
function calculateShippingCost(order: Order, customer: Customer): number {
    if (customer.isPremium && order.total >= 100) {
        return 0;
    }
    
    return calculateStandardShipping(order.weight, order.destination);
}
```