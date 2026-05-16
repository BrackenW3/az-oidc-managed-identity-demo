## 2026-02-16 - Workflow Dispatch Inputs
**Learning:** Hardcoding environment names in workflows forces users to modify YAML for testing different environments.
**Action:** Use `workflow_dispatch` inputs with a default value to allow flexible environment selection without code changes.

## 2024-05-16 - Dynamic Empty States with ARIA
**Learning:** Empty states caused by dynamic changes like search filtering are often missed by screen readers because the element's inner HTML changes without triggering an announcement.
**Action:** Always add `role="status"` to dynamic empty state containers (e.g., "No resources found") so screen readers automatically announce the new content to users.
