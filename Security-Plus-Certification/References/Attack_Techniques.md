| Attack Technique                         |                       Category | What it is / Purpose                                                                                    |
| ---------------------------------------- | -----------------------------: | ------------------------------------------------------------------------------------------------------- |
| **Phishing**                             |             Social engineering | Mass-email scam that tricks users into revealing credentials or clicking malicious links.               |
| **Spear phishing**                       |             Social engineering | Targeted phishing at a specific person or org to steal credentials or deliver malware.                  |
| **Whaling**                              |             Social engineering | Spear phishing aimed at high-value targets (execs) to steal sensitive info or authorize wire transfers. |
| **Vishing / Smishing**                   | Social engineering / Telephony | Voice (vishing) or SMS (smishing) attacks to trick users into giving info or codes.                     |
| **Pretexting**                           |             Social engineering | Attacker creates a fabricated scenario to obtain information or access.                                 |
| **Baiting**                              |  Social engineering / Physical | Enticing user (e.g., infected USB) to install malware or reveal info.                                   |
| **Tailgating / Piggybacking**            |                       Physical | Following authorized personnel into restricted areas to bypass physical controls.                       |
| **Insider threat**                       |               Human / Internal | Malicious or negligent actions by employees that compromise security.                                   |
| **Password attacks (brute force)**       |                     Credential | Trying all combinations until password found.                                                           |
| **Password spraying**                    |                     Credential | Trying a small set of common passwords across many accounts to avoid lockouts.                          |
| **Credential stuffing**                  |                     Credential | Using leaked username/password pairs from one breach to access other services.                          |
| **Pass-the-hash / Pass-the-ticket**      |          Credential / Kerberos | Reusing captured authentication tokens/hashes to access resources without cracking passwords.           |
| **Keylogging**                           |             Malware / Endpoint | Recording keystrokes to capture credentials and data.                                                   |
| **Man-in-the-middle (MITM)**             |                        Network | Intercepting and possibly altering communications between two parties.                                  |
| **ARP poisoning / ARP spoofing**         |                        Network | Poisoning ARP cache to redirect LAN traffic through attacker.                                           |
| **DNS poisoning / DNS spoofing**         |                        Network | Corrupting DNS responses to redirect users to malicious sites.                                          |
| **Replay attack**                        |             Network / Protocol | Re-sending captured valid data (like a token) to repeat a transaction or gain access.                   |
| **Session hijacking**                    |                  Web / Session | Stealing a valid session token to impersonate a user.                                                   |
| **Cross-site scripting (XSS)**           |                    Application | Injecting script into webpages that run in other users’ browsers to steal cookies or perform actions.   |
| **SQL injection**                        |                    Application | Injecting SQL commands to manipulate or exfiltrate database data.                                       |
| **Cross-site request forgery (CSRF)**    |              Web / Application | Forcing a logged-in user’s browser to submit a forged request (state-changing actions).                 |
| **Command injection / OS injection**     |                    Application | Executing shell/OS commands through vulnerable app inputs.                                              |
| **Directory traversal**                  |                    Application | Accessing files/directories outside intended directories via path manipulation.                         |
| **Buffer overflow**                      |          Application / Exploit | Exceeding a buffer to overwrite memory and execute arbitrary code.                                      |
| **DLL injection / Code injection**       |              Malware / Exploit | Injecting code into processes to run malicious functionality within trusted processes.                  |
| **Ransomware**                           |                        Malware | Encrypts victims’ files and demands payment for the key.                                                |
| **Worms**                                |              Malware / Network | Self-replicating malware that spreads across networks without user action.                              |
| **Trojans / Backdoors**                  |                        Malware | Malware disguised as legitimate software, often opens remote access for attacker.                       |
| **Rootkits**                             |          Malware / Persistence | Hides malware presence and gives persistent privileged access.                                          |
| **Supply-chain attack**                  |           Strategic / Software | Compromising a third-party product or update to infect many downstream victims.                         |
| **Zero-day exploit**                     |        Vulnerability / Exploit | Exploiting a previously unknown vulnerability before a patch exists.                                    |
| **Drive-by download**                    |                  Web / Malware | Unintentional download/execution of malware by visiting a compromised website.                          |
| **Watering hole**                        |                 Targeted / Web | Compromising websites likely visited by target group to infect them.                                    |
| **DDoS (Distributed Denial of Service)** |         Availability / Network | Overwhelming a target with traffic to disrupt services (including amplification attacks).               |
| **Amplification attacks**                |                        Network | Using open UDP/TCP services (e.g., DNS, NTP) to amplify traffic in DDoS attacks.                        |
| **Cryptojacking**                        |       Malware / Resource abuse | Unauthorized use of systems to mine cryptocurrency.                                                     |
| **Data exfiltration / Beaconing**        |                Data theft / C2 | Stealthy extraction of sensitive data or periodic outbound signaling to attacker C2 servers.            |
