## 2026-02-16 - Workflow Dispatch Inputs
**Learning:** Hardcoding environment names in workflows forces users to modify YAML for testing different environments.
**Action:** Use `workflow_dispatch` inputs with a default value to allow flexible environment selection without code changes.

## 2026-04-16 - Screen Reader Announcements for Dynamic Empty States
**Learning:** When client-side filtering results in an empty state (e.g., "No resources found"), screen readers will not announce this change by default since the focus hasn't moved.
**Action:** Always add `role="status"` to dynamic empty state containers so screen readers announce the text content automatically when the element is rendered to the DOM, improving the accessibility of real-time search filtering.
