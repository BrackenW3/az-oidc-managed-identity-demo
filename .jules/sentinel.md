## 2024-05-23 - [Privilege Escalation via Self-Modification]
**Vulnerability:** User-Assigned Managed Identity granted Contributor role on its own Resource Group.
**Learning:** This allows the identity to modify its own Federated Credentials, potentially adding new credentials for attackers to persist access or expand scope.
**Prevention:** Follow Least Privilege. Default to Reader role. If write access is needed, scope it narrowly or ensure the identity cannot modify its own resource or credentials (e.g., separate RG for identity and resources).
