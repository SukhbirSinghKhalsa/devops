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
