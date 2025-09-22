| System / Technology                                         | Purpose / Function                                                                                                          |
| ----------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| **IDS (Intrusion Detection System)**                        | Monitors traffic and alerts on suspicious or malicious activity. Passive — does not block.                                  |
| **IPS (Intrusion Prevention System)**                       | Monitors traffic like IDS but can block, drop, or reject malicious traffic in real time.                                    |
| **Firewall**                                                | Controls traffic between networks using rules (filtering by IP, port, protocol). Can be hardware, software, or cloud-based. |
| **Proxy Server**                                            | Intermediary between clients and the internet; can filter traffic, hide IPs, cache content.                                 |
| **Jump Server / Bastion Host**                              | A hardened system used to manage and access devices in a secure network.                                                    |
| **SIEM (Security Information and Event Management)**        | Collects, aggregates, correlates, and analyzes logs from multiple systems for centralized monitoring.                       |
| **NAC (Network Access Control)**                            | Ensures only compliant and authorized devices can connect to the network (e.g., posture assessment).                        |
| **DLP (Data Loss Prevention)**                              | Monitors and prevents unauthorized transfer of sensitive data (email, cloud, endpoints).                                    |
| **HIDS/HIPS (Host-based IDS/IPS)**                          | Installed on endpoints to monitor activity; can alert (HIDS) or block (HIPS) malicious actions.                             |
| **NIDS/NIPS (Network-based IDS/IPS)**                       | Monitors entire network traffic for suspicious activity.                                                                    |
| **VPN (Virtual Private Network)**                           | Encrypts traffic between remote clients and networks over untrusted channels.                                               |
| **WAF (Web Application Firewall)**                          | Protects web applications from attacks like SQL injection, XSS, CSRF.                                                       |
| **Load Balancer**                                           | Distributes network or application traffic across multiple servers to ensure availability and performance.                  |
| **UTM (Unified Threat Management)**                         | All-in-one security appliance (firewall, IDS/IPS, antivirus, content filtering, etc.).                                      |
| **CASB (Cloud Access Security Broker)**                     | Security policy enforcement point between users and cloud services (visibility, compliance, data protection).               |
| **EDR (Endpoint Detection and Response)**                   | Advanced endpoint monitoring, threat detection, and response capabilities.                                                  |
| **SOAR (Security Orchestration, Automation, and Response)** | Automates security workflows and integrates with SIEM/EDR to speed up incident response.                                    |
| **Honeypot / Honeynet**                                     | Decoy system or network designed to attract attackers for analysis and detection.                                           |
| **Sandbox**                                                 | Isolated environment to safely run or analyze suspicious files/code.                                                        |
| **SSL/TLS Accelerator / Offloader**                         | Hardware/software that handles encryption tasks to offload from main servers.                                               |
| **Mail Gateway / Spam Filter**                              | Filters and inspects email for spam, malware, phishing attempts.                                                            |
| **MFA Server**                                              | Manages multi-factor authentication across systems and apps.                                                                |
| **AAA Server (RADIUS, TACACS+)**                            | Provides Authentication, Authorization, and Accounting for network/device access.                                           |
| **SIEM with SOAR Integration**                              | Collects logs (SIEM) + automates incident handling (SOAR).                                                                  |
