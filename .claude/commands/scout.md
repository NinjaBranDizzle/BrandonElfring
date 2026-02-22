Analyze ScoutAPM performance data and identify the top 10 actionable items to improve application performance.

## Instructions

1. **Get the application ID**: Use the `mcp__scout-apm__ScoutApmMcpServerListAppsTool` to list available applications and identify the application ID.

2. **Gather performance insights**: Use the following ScoutAPM tools to collect performance data:
   - `mcp__scout-apm__ScoutApmMcpServerGetTopItemsTool` - Get the top performance bottlenecks
   - `mcp__scout-apm__ScoutApmMcpServerGetAllInsightsTool` - Get all insight types (N+1 queries, memory bloat, slow queries)
   - `mcp__scout-apm__ScoutApmMcpServerGetMetricTool` - Get response time and throughput metrics for context

3. **Analyze and prioritize**: Based on the collected data, identify the **top 10 most impactful performance issues** that can be addressed. Prioritize by:
   - Frequency of occurrence
   - Impact on response time
   - Feasibility of fix (N+1 queries, slow queries are often quick wins)

4. **For each issue, provide**:
   - **What**: Description of the performance problem
   - **Where**: The endpoint, controller action, or code location involved
   - **Impact**: How it affects user experience (response time increase, frequency)
   - **How to fix**: Specific, actionable recommendations for resolving the issue
   - **Code location**: If possible, identify the relevant files in the codebase

5. **Present findings**: Format the report clearly with:
   - Executive summary of overall application health
   - Top 10 prioritized issues with details
   - Quick wins vs. longer-term improvements
   - Estimated impact of addressing each issue

## Optional: Deep dive on a specific issue

If the user provides $ARGUMENTS (e.g., an endpoint name or insight type), focus the analysis on that specific area and provide more detailed trace analysis using:
- `mcp__scout-apm__ScoutApmMcpServerListEndpointsTool`
- `mcp__scout-apm__ScoutApmMcpServerListEndpointTracesTool`
- `mcp__scout-apm__ScoutApmMcpServerFetchTraceTool`
