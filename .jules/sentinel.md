## 2024-05-23 - [Privilege Escalation via Self-Modification]
**Vulnerability:** User-Assigned Managed Identity granted Contributor role on its own Resource Group.
**Learning:** This allows the identity to modify its own Federated Credentials, potentially adding new credentials for attackers to persist access or expand scope.
**Prevention:** Follow Least Privilege. Default to Reader role. If write access is needed, scope it narrowly or ensure the identity cannot modify its own resource or credentials (e.g., separate RG for identity and resources).

## 2024-05-24 - [Missing Security Headers for Cloudflare Pages Deployment]
**Vulnerability:** Static dashboards deployed to Cloudflare Pages lacked basic HTTP security headers (CSP, X-Frame-Options, etc.), exposing users to potential XSS, clickjacking, and MIME-sniffing attacks.
**Learning:** Cloudflare Pages does not add default security headers. They must be explicitly configured via a `_headers` file in the static hosting directory.
**Prevention:** Always include a `_headers` file with secure defaults (Content-Security-Policy, X-Frame-Options, X-Content-Type-Options, Referrer-Policy) when configuring a new Cloudflare Pages project.
