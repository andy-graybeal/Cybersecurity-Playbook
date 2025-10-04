| Ethernet Standard                             | Speed                 | Pairs Used | Typical / Minimum Cable Category     | Notes & Caveats                                                                                                   |
| --------------------------------------------- | --------------------- | ---------- | ------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| **10Base-T**                                  | 10 Mbps               | 2 pairs    | Cat3 (or better)                     | Early twisted-pair Ethernet; Cat5 and above obviously also work. ([Cisco][1])                                     |
| **100Base-T (100Base-TX)**                    | 100 Mbps              | 2 pairs    | Cat5, Cat5e or better                | Often just “Cat5” historically; but in modern networks Cat5e is used. ([trueCABLE][2])                            |
| **1000Base-T (Gigabit Ethernet over copper)** | 1,000 Mbps (1 Gbps)   | 4 pairs    | Cat5e (or better: Cat6, Cat6a, etc.) | Cat5e is typically considered the minimum for gigabit speed. ([trueCABLE][2])                                     |
| **10GBase-T**                                 | 10,000 Mbps (10 Gbps) | 4 pairs    | Cat6a (or better: Cat7, Cat8)        | Cat6 can sometimes work for shorter runs, but for full 100m runs Cat6a or higher is recommended. ([Wikipedia][3]) |

[1]: https://www.cisco.com/c/en/us/support/docs/routers/10000-series-routers/46792-ethbase.pdf?utm_source=chatgpt.com "Specifications for Ethernet 100BaseTX and 10BaseT Cables - Cisco"
[2]: https://www.truecable.com/blogs/cable-academy/10-100-1000-base-t?utm_source=chatgpt.com "What does 10/100/1000 Base-T mean? - trueCABLE"
[3]: https://en.wikipedia.org/wiki/10_Gigabit_Ethernet?utm_source=chatgpt.com "10 Gigabit Ethernet"

🧠 Key points to remember (for A+ / general use):

The “Base-T” standards all refer to twisted-pair copper Ethernet using RJ-45 style connectors.  
As speed increases, the cable category requirement becomes stricter (better shielding, tighter twists, lower crosstalk).  
Even if a cable can physically connect, it might not reliably support high speeds if it’s a lower category.

A good rule of thumb:  
For 10 Mbps → Cat3 is enough  
For 100 Mbps → Cat5 / Cat5e  
For 1 Gbps → Cat5e minimum  
For 10 Gbps → Cat6a or better for full-length runs
