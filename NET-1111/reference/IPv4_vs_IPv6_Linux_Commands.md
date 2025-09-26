| **IPv4 Command**   | **Purpose**                              | **IPv6 Equivalent Command**         | **Notes**                                        |
| ------------------ | ---------------------------------------- | ----------------------------------- | ------------------------------------------------ |
| `arp`              | Show ARP cache (IPv4 neighbor mappings). | `ip -6 neigh`  (or `ip neigh show`) | Displays IPv6 **Neighbor Discovery (ND) cache**. |
| `ifconfig` (older) | Show / configure interfaces.             | `ip -6 addr` and `ip -6 link`       | Modern `ip` commands replace ifconfig.           |
| `ping`             | ICMP echo for IPv4.                      | `ping6` (or `ping -6`)              | Tests IPv6 connectivity.                         |
| `traceroute`       | Show IPv4 route path.                    | `traceroute6` (or `traceroute -6`)  | Traces IPv6 hops.                                |
| `netstat -rn`      | Show IPv4 routing table.                 | `ip -6 route show`                  | Shows IPv6 routing table.                        |
| `dig` / `nslookup` | Query DNS (IPv4/IPv6).                   | `dig AAAA <hostname>`               | Retrieves IPv6 (AAAA) DNS records.               |

