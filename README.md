#### This is for my reference to quickly understand devsecops best practises

monitor the pipeline for security issues
use container security checks


##### Scan git repositories for finding potential credentials leakage.
- gittyleaks, prettier, coveralls


##### SCA (Software Composition Analysis)
- process of automating application security for managing third-party and open-source components of the codebase. 
- helps prevent Supply-chain attacks
finding connected weak points to enter into system
- tools - retirejs, snyk, blackduck

##### SAST (Static Application Security Test)
-  part of a Code Review (white-box testing) and debugging that is done by examining the code without executing the program.
- codeql, sonarcube

##### IaC Scanning (Scanning Terraform, HelmChart code to find misconfiguration)

##### container scanning:
- docker lint syntax check
- dependency checks
- OS check
- Security profiles
- smoke test
- tools - trivy, aquasec vulnerability/misconfiguration scanner for containers 

##### container hardening:
- use only trusted base images
- apply security patches
- implement principle of least privileged access - restricting root access
- enable resource limitation - to prevent resource exhaustion attacks
- use image vulnerability scanning
- Employ Secure Network Configuration   - container network segmentation and isolation. 

##### IAST (Interactive Application Security Testing)
- example s3 bucket created with public read access is detected
- tools:
-- checkov: Prevent cloud misconfigurations during build-time
-- tflint: terraform linter
-- tfsec: security scan for tf code
-- trivy: built-in policies to detect configuration issues


##### API Security


##### DAST (Dynamic Application Security Test)
- DAST is a “Black-Box” testing technique that can find security vulnerabilities and weaknesses in a running application by injecting malicious payloads to identify potential flaws that allow for attacks like SQL injections or cross-site scripting (XSS), etc.
- tools:
- owasp nettacker - Automated information gathering and vulnerability scanner with API and Web UI.

- sed attack proxy - security scanning
- Acunetix

##### CNAPP (Cloud Native Application Protection)

##### Infrastructure scanning

##### Continuous Scanning from other tools

##### Compliance check
- Venta security tool is used for SOC2 compliance check
- example: - storage account has public access
- example2:  no alerts/ metrics are configured for virtual machines or storage accounts


#### Detailed documentation from OWASP: https://github.com/OWASP/DevSecOpsGuideline


#### some examples of secutity checks 
| Area | Status | Notes |
|------|--------|-------|
| Secret Management | ✅ Mostly good | Key Vault used, but passwords leaked into env vars |
| Network Security | ⚠️ Partial | NSGs + private subnets exist, but Key Vault network rules are off |
| Encryption in Transit | ⚠️ Partial | TLS 1.2 on Redis, but non-SSL port is open; Grafana DB uses no SSL |
| CI/CD Security Gates | ❌ Disabled | Checkov and lint triggers are commented out |
| Observability / Alerting | ✅ Good | Log Analytics, App Insights, PagerDuty, metric + log alerts all wired up |
| Backup & Recovery | ✅ Good | Geo-redundant backup, point-in-time restore, prevent_destroy in place |
| Least Privilege (IAM) | ⚠️ Partial | EventHub rules are correct; Service Principal role scope is broad |
| WAF / DDoS Protection | ❌ Missing | WAF policy commented out; no DDoS plan on VNet |
| Secret Rotation | ⚠️ Partial | App secret rotation exists; SP secret causes constant drift |
| Tagging / Governance | ✅ Good | Tags consistently applied across all resources |


### 1. Secrets Stored in Key Vault
Most credentials (PostgreSQL passwords, PagerDuty keys, OAuth client secrets, Keycloak secrets) are read from Azure Key Vault using `data.azurerm_key_vault_secret.*`. This is the right approach — secrets never live in code.

### 2. Key Vault Hardening -Key Vaults
- `purge_protection_enabled` — prevents accidental or malicious permanent deletion
- `soft_delete_retention_days` — gives you a recovery window
- `enabled_for_disk_encryption` — allows Azure Disk Encryption to use the vault

### 3. Private Networking for Databases
PostgreSQL is deployed inside a private subnet with a private DNS zone. Public access is controlled by `var.postgres_public_network_access_enabled` (configurable). This stops the database from being exposed to the open internet.

### 4. Network Segmentation (Subnets + NSGs)
- Dedicated subnets for ACA public and private environments
- NSGs (Network Security Groups) attached to each subnet
- NAT Gateway for outbound traffic (so internal services don't need public IPs)
- Service endpoints for Key Vault, Storage, EventHub, etc.

### 5. TLS Enforcement on Redis
The active Redis configuration sets `minimum_tls_version = "1.2"` — this prevents old, insecure TLS connections.

### 6. Observability Stack
You have a solid monitoring setup:
- Log Analytics Workspace + Application Insights linked to container app environments
- Diagnostic settings forwarding all container app logs
- Metric alerts (`alert_metric`), log query alerts (`log_alert`), and activity log alerts
- PagerDuty and Grafana integrated for on-call and dashboards

### 7. Backup & Disaster Recovery
- PostgreSQL has `geo_redundant_backup_enabled` and `backup_retention_days`
- Point-in-time restore (`PointInTimeRestore`) and Geo-restore (`GeoRestore`) modes are configured
- `lifecycle { prevent_destroy = true }` on the PostgreSQL server protects against accidental `terraform destroy`

### 8. Least Privilege on EventHub
EventHub has separate authorization rules: one for `listen` only and one for `send` only. Applications only get the permission they need — not both.

### 9. App Registration Secret Rotation
The `app_reg` module uses `time_rotating` with a 365-day window, which forces secret renewal automatically.

### 10. CI/CD Pipeline Exists
GitHub Actions workflows exist for:
- Terraform format checking (`terraform fmt`)
- Terraform validation (`terraform validate`)
- Checkov security scanning
- Version bump enforcement on PRs

### 11. Zone Redundancy
ACA environments use `zone_redundancy_enabled`, which spreads workloads across Azure availability zones for higher resilience.

