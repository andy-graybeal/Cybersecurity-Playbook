| **Class** | **First Octet Range** | **Default Subnet Mask**   | **Number of Networks** | **Hosts per Network** | **Purpose / Notes**                       |
| --------- | --------------------- | ------------------------- | ---------------------- | --------------------- | ----------------------------------------- |
| **A**     | 1 – 126               | 255.0.0.0 (/8)            | 128 (0 & 127 reserved) | ~16 million (2²⁴−2)   | Very large networks; first bit = 0        |
| **B**     | 128 – 191             | 255.255.0.0 (/16)         | 16,384                 | ~65,000 (2¹⁶−2)       | Medium-sized networks; first bits = 10    |
| **C**     | 192 – 223             | 255.255.255.0 (/24)       | ~2 million             | 254 (2⁸−2)            | Small networks; first bits = 110          |
| **D**     | 224 – 239             | N/A (not host addressing) | N/A                    | N/A                   | Multicast; first bits = 1110              |
| **E**     | 240 – 255             | N/A                       | N/A                    | N/A                   | Experimental, research; first bits = 1111 |

## Extra Notes for Exams

- **Loopback Address Range**  
  - `127.0.0.0 – 127.255.255.255` (reserved for localhost testing, not usable in Class A)

- **Private IP Address Ranges**  
  - **Class A:** `10.0.0.0 – 10.255.255.255`  
  - **Class B:** `172.16.0.0 – 172.31.255.255`  
  - **Class C:** `192.168.0.0 – 192.168.255.255`
