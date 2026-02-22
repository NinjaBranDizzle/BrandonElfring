# Railway MCP Operations

Delegate Railway API operations to a subagent to preserve main context.

## Instructions

When this command is invoked, spawn a Task agent to handle the Railway operation. The subagent has access to all `mcp__Railway__*` tools.

**IMPORTANT**: Use the Task tool to spawn a subagent with `subagent_type: "general-purpose"`. Pass the user's request and let the subagent do all the MCP work in its own context.

## Task for Subagent

Spawn a Task with this prompt:

```
You are a Railway MCP specialist. You have access to all mcp__Railway__* tools.

User request: $ARGUMENTS

Working directory for this project: /Users/brandonelfring/RubymineProjects/BrandonElfring

Available Railway MCP tools:
- check-railway-status: Verify CLI is installed and logged in
- list-projects: List all Railway projects
- list-services: List services in the linked project
- list-variables: Show environment variables
- set-variables: Set environment variables
- deploy: Deploy current directory
- get-logs: View build/deploy logs (use logType: "build" or "deploy")
- list-deployments: Show deployment history
- generate-domain: Create public URL for a service
- create-project-and-link: Create new project and link it
- create-environment: Create staging/prod environments
- link-service: Link local directory to a service
- link-environment: Switch between environments
- deploy-template: Deploy from Railway templates

Best practices:
1. Always check-railway-status first
2. Use workspacePath="/Users/brandonelfring/RubymineProjects/BrandonElfring"
3. Use json: true for programmatic parsing when helpful
4. Monitor builds with logType: "build", runtime with logType: "deploy"

Complete the user's request using the appropriate MCP tools. Provide a clear summary of what was done and any relevant results.
```

## User Request

$ARGUMENTS
