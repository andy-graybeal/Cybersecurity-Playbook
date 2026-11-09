| **Record Type** | **Full Name**                | **Purpose / Usage**                                                                   |
| --------------- | ---------------------------- | ------------------------------------------------------------------------------------- |
| **A**           | Address Record               | Maps a domain name to an IPv4 address.                                                |
| **AAAA**        | IPv6 Address Record          | Maps a domain name to an IPv6 address.                                                |
| **CNAME**       | Canonical Name               | Creates an alias from one domain name to another (e.g., www → main domain).           |
| **MX**          | Mail Exchange                | Specifies mail servers responsible for handling email for a domain.                   |
| **NS**          | Name Server                  | Identifies the authoritative DNS servers for a domain.                                |
| **PTR**         | Pointer Record               | Maps an IP address to a domain name (reverse DNS lookup).                             |
| **SOA**         | Start of Authority           | Defines authoritative information about a DNS zone (e.g., admin email, refresh time). |
| **TXT**         | Text Record                  | Holds arbitrary text, often used for SPF, DKIM, DMARC, and verification data.         |
| **SRV**         | Service Record               | Specifies servers for specific services (e.g., SIP, Microsoft AD).                    |
| **CAA**         | Certification Authority Auth | Defines which certificate authorities may issue SSL/TLS certificates for a domain.    |
| **DNSKEY**      | DNS Security Key             | Holds public keys used in DNSSEC validation.                                          |
| **NAPTR**       | Naming Authority Pointer     | Used for advanced applications like SIP and ENUM (rewriting rules for domains).       |
