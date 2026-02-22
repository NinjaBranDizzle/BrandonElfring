# Screenshot Analysis Command

Analyze the most recent screenshot from the user's desktop and address the described issue.

## Instructions

1. First, find the most recent screenshot on the desktop by running:
   ```bash
   ls -t ~/Desktop/Screenshot*.png 2>/dev/null | head -1
   ```

2. If no screenshot is found, check for other common screenshot naming patterns:
   ```bash
   ls -t ~/Desktop/*.png 2>/dev/null | head -1
   ```

3. Once you have the screenshot path, use the Read tool to view the image file.

4. Analyze the screenshot in the context of this Rails application codebase.

5. Address the user's issue: $ARGUMENTS

## User's Issue Description

$ARGUMENTS

## Important Notes

- Look for UI issues, errors, formatting problems, or whatever the user describes
- Cross-reference what you see with the codebase to identify the relevant files
- Provide actionable fixes based on what you observe in the screenshot
