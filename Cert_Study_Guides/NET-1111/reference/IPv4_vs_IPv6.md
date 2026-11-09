| **Feature**           | **IPv4**                             | **IPv6**                                             | **Enhancement / Benefit**                           |
| --------------------- | ------------------------------------ | ---------------------------------------------------- | --------------------------------------------------- |
| **Address Size**      | 32-bit (≈ 4.3 billion addresses)     | 128-bit (≈ 3.4×10³⁸ addresses)                       | Vastly larger address space (no more shortage).     |
| **Address Notation**  | Dotted decimal (e.g., `192.168.1.1`) | Hexadecimal colon-separated (e.g., `2001:db8::1`)    | Easier aggregation, hierarchical addressing.        |
| **Configuration**     | Manual or DHCP for most hosts        | Stateless Address Autoconfiguration (SLAAC) + DHCPv6 | Simplifies configuration, plug-and-play networking. |
| **Header Complexity** | Variable length (20–60 bytes)        | Fixed length (40 bytes) with extension headers       | More efficient processing by routers.               |
| **Security**          | IPSec optional                       | IPSec mandatory (part of base protocol)              | Stronger built-in security framework.               |
| **QoS Support**       | Type of Service (ToS), limited       | Traffic Class + Flow Label fields                    | Better Quality of Service handling.                 |
| **Broadcast**         | Uses broadcast traffic               | No broadcast; uses multicast & anycast               | Reduces unnecessary traffic, more efficient.        |
| **NAT Requirement**   | Often needed due to address shortage | Not needed (huge address space)                      | End-to-end connectivity restored.                   |
| **Fragmentation**     | Routers & hosts can fragment packets | Only hosts fragment; routers don’t                   | Simplifies router workload, improves performance.   |
| **Mobility Support**  | Limited, add-on features             | Built-in mobility support                            | Better for mobile devices and IoT.                  |
