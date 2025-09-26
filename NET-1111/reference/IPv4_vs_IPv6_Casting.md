## IPv4 vs IPv6 Casting

| **Type** | **IPv4** | **IPv6** | **Key Difference / Notes** |
|----------|----------|----------|-----------------------------|
| **Unicast** | One-to-one communication. Example: `192.168.1.10` → `192.168.1.1`. | One-to-one communication. Example: `2001:db8::1` → `2001:db8::2`. | Concept is the same in both protocols. |
| **Broadcast** | One-to-all communication. Example: `255.255.255.255` or subnet broadcast like `192.168.1.255`. | ❌ **Does not exist** in IPv6. | IPv6 removed broadcast to reduce unnecessary traffic. |
| **Multicast** | One-to-many (hosts that join a group). Example: `224.0.0.9` (RIP). | One-to-many. Example: `ff02::1` (all nodes), `ff02::2` (all routers). | IPv6 relies heavily on multicast (replaces broadcast). |
| **Anycast** | Rarely used in IPv4. | Widely supported in IPv6. One-to-nearest (based on routing). Example: multiple DNS servers share one anycast address. | IPv6 standardized anycast. |
| **Geocast** (not official) | Sometimes experimental. | Research/experimental only. | Not part of standard IPv6 exam focus. |

### Exam Tips
- **IPv6 has no broadcast** — multicast and anycast take its place.  
- Key multicast groups to remember:  
  - `ff02::1` → all nodes  
  - `ff02::2` → all routers  
  - `ff02::5` → OSPF routers  
