Analyze recent errors from Rollbar and provide actionable insights for debugging and resolution.

## Arguments

`$ARGUMENTS` can specify an environment and/or error details:
- **Environments**: `production` (default), `staging`, `development`
- **Error counter**: A number like `123` to focus on a specific error
- **Search query**: Text like `NoMethodError` to filter errors

Examples:
- `/rollbar` - production errors (default)
- `/rollbar staging` - staging errors
- `/rollbar production 123` - specific error #123 in production
- `/rollbar staging NoMethodError` - search for NoMethodError in staging

## Instructions

1. **Parse arguments**: Check `$ARGUMENTS` for environment (`production`, `staging`, `development`), error counter (number), or search query (text). Default to `production` if no environment specified.

2. **Get recent errors**: Use the `mcp__rollbar__list-items` tool to retrieve recent error items:
   ```
   mcp__rollbar__list-items with:
   - status: "active"
   - environment: (from arguments, default "production")
   - limit: 20
   ```

3. **Get top recurring errors**: Use `mcp__rollbar__get-top-items` with the same environment to identify the most frequent errors that should be prioritized.

4. **For each significant error, gather details**: Use `mcp__rollbar__get-item-details` with the item's counter to get:
   - Full stack trace
   - Occurrence count and frequency
   - Affected users/sessions
   - Request context (params, headers, etc.)

5. **Analyze and categorize errors** by:
   - **Severity**: Critical errors affecting core functionality vs. minor edge cases
   - **Frequency**: How often the error occurs
   - **Impact**: Number of users affected
   - **Recency**: When errors started occurring (could indicate recent deployments)

6. **For each error, provide**:
   - **Error Type**: The exception class and message
   - **Where**: Controller action, background job, or code location
   - **Stack Trace Summary**: Key frames showing where the error originates
   - **Possible Cause**: Analysis of what might be causing the error
   - **How to Fix**: Specific recommendations for resolution
   - **Code Location**: Relevant files in the codebase to investigate

7. **Present findings** with:
   - Summary of error landscape (total active errors, severity breakdown)
   - Top 3-5 prioritized errors to address
   - Quick wins vs. deeper investigations needed
   - Any patterns (e.g., errors from same controller, same time period)

## Optional: Deep dive on a specific error

If the user provides $ARGUMENTS (e.g., an error counter number like "123" or a search query like "NoMethodError"), focus on that specific error:
- Use `mcp__rollbar__get-item-details` for the specific item
- Provide detailed stack trace analysis
- Search the codebase for the affected code
- Suggest specific code changes to fix the issue

## Optional: Check recent deployments

Use `mcp__rollbar__get-deployments` to correlate errors with recent deployments:
```
mcp__rollbar__get-deployments with limit: 5
```

This can help identify if errors were introduced by a specific release.

## Available Rollbar Tools Reference

- `mcp__rollbar__list-items` - List errors with filtering (status, level, environment, query)
- `mcp__rollbar__get-item-details` - Get full details for a specific error (use counter value)
- `mcp__rollbar__get-top-items` - Get most frequent/impactful errors
- `mcp__rollbar__get-deployments` - List recent deployments
- `mcp__rollbar__update-item` - Update error status (resolve, mute, etc.)
- `mcp__rollbar__get-version` - Get version details
- `mcp__rollbar__get-replay` - Get session replay data if available
