| **Subtopic**                     | **Key Data / Concepts**                                                                                                                                       |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Routing Basics**               | Routing = forwarding packets based on destination IP; Uses a routing table to determine the best path                                                         |
| **Static Routing**               | Manually configured; Simple and predictable; No automatic updates; Good for small or stable networks                                                          |
| **Dynamic Routing**              | Routers exchange routes automatically; Adapts to changes; Examples: RIP (v1/v2 for IPv4, RIPng for IPv6), OSPF (OSPFv2 for IPv4, OSPFv3 for IPv6), EIGRP, BGP |
| **Default Route**                | IPv4: `0.0.0.0/0` → often points to ISP or edge router; IPv6: `::/0` → equivalent default route                                                               |
| **Next-Hop**                     | IPv4: IP address of the next router; IPv6: can use link-local address of the next-hop router                                                                  |
| **Routing Table**                | Contains destination network, prefix length, next-hop, outgoing interface, metric; Separate tables for IPv4 and IPv6                                          |
| **Administrative Distance (AD)** | Used to choose between routes from different sources; Examples: Connected (0), Static (1), OSPF (110), RIP (120)                                              |
| **Metrics**                      | IPv4 & IPv6 use similar metrics (hop count, cost, bandwidth, delay) depending on the protocol                                                                 |
| **Special IPv4 Notes**           | Private ranges: 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16; Loopback: 127.0.0.0/8                                                                              |
| **Special IPv6 Notes**           | Link-local: `fe80::/10` (mandatory for all interfaces, often used as next-hop); Global unicast: starts with `2000::/3`; Loopback: `::1`                       |
