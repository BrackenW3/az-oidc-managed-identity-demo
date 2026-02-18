## 2026-02-16 - Avoid azure/powershell action for simple scripts
**Learning:** The `azure/powershell` action with `azPSVersion: "latest"` adds significant overhead due to version checking and installation. For simple scripts on hosted runners, using `run: pwsh` with the pre-installed Az module is much faster.
**Action:** Replace `azure/powershell` with `run: pwsh` when specific module versions aren't critical, ensuring `enable-AzPSSession: true` is set in the login step.
