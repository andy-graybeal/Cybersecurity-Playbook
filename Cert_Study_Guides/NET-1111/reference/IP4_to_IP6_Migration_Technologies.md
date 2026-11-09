## IPv4 to IPv6 Transition Technologies

| **Technology** | **Category** | **How It Works** | **Use Case** |
|----------------|--------------|------------------|--------------|
| **Dual Stack** | Coexistence  | Devices/routers run both IPv4 and IPv6 simultaneously. | Smooth migration; supports both protocols during transition. |
| **Tunneling**  | Encapsulation | Encapsulates IPv6 packets inside IPv4 packets so they can travel over IPv4 networks. | Allows IPv6 traffic to pass through IPv4-only infrastructure. |
| → **6to4**     | Tunneling | Automatically generates IPv6 addresses from IPv4 and tunnels over IPv4 Internet. | Quick IPv6 deployment without manual configuration. |
| → **Teredo**   | Tunneling | Encapsulates IPv6 packets inside IPv4 **UDP** packets, works through NAT. | For hosts behind NAT devices that need IPv6 connectivity. |
| → **ISATAP**   | Tunneling | Treats IPv4 network as a virtual IPv6 link. | Connects IPv6 hosts across an IPv4 intranet. |
| **NAT64 / DNS64** | Translation | Translates between IPv6-only and IPv4-only hosts (with DNS64 synthesizing AAAA records). | Enables IPv6-only clients to reach IPv4 servers. |
| **NAT-PT** (deprecated) | Translation | Network Address Translation – Protocol Translation. | Older version of NAT64, now largely replaced. |

### Exam Tips
- Cisco emphasizes **Dual Stack**, **Tunneling (6to4, Teredo, ISATAP)**, and **NAT64/DNS64**.  
- **NAT-PT** is mentioned only as *deprecated*.  
