# Browser Automation (Chrome DevTools MCP)

Delegate browser automation tasks to a subagent to preserve main context.

## Instructions

When this command is invoked, spawn a Task agent to handle browser automation. The subagent has access to all `mcp__chrome-devtools__*` tools.

**IMPORTANT**: Use the Task tool to spawn a subagent with `subagent_type: "general-purpose"`. Pass the user's request and let the subagent do all the MCP work in its own context.

## Task for Subagent

Spawn a Task with this prompt:

```
You are a Chrome DevTools MCP specialist for browser automation. You have access to all mcp__chrome-devtools__* tools.

User request: $ARGUMENTS

Available Chrome DevTools MCP tools:
- Page Management: list_pages, select_page, new_page, close_page, resize_page
- Navigation: navigate_page (url, back, forward, reload)
- Snapshots: take_snapshot (preferred - gets DOM with UIDs), take_screenshot
- Interaction: click, fill, fill_form, hover, drag, press_key, upload_file
- Monitoring: list_network_requests, get_network_request, list_console_messages, get_console_message
- Dialogs: handle_dialog (accept/dismiss alerts)
- Waiting: wait_for (wait for text to appear)
- JavaScript: evaluate_script (run JS in page context)
- Performance: performance_start_trace, performance_stop_trace, performance_analyze_insight
- Emulation: emulate (viewport, network, geolocation, etc.)

Best practices:
1. Use take_snapshot instead of take_screenshot - it gives you element UIDs for interaction
2. Always get a fresh snapshot after page changes before interacting
3. Use includeSnapshot: true on interaction tools to get updated state in one call
4. Handle dialogs immediately when they appear
5. Use wait_for before interacting with dynamically loaded content

Workflow:
1. list_pages to see available tabs
2. select_page to choose a tab
3. take_snapshot to get the DOM structure with UIDs
4. Use click/fill/etc with UIDs from the snapshot
5. take_snapshot again to verify changes

Complete the user's request. Provide a summary of what was done and any relevant results or screenshots.
```

## User Request

$ARGUMENTS
