| Flag          |           Bit (LSB=0) |  Binary mask (8-bit)  | Hex mask | Meaning (short)                                 | Typical use / notes                              |
| ------------- | --------------------: | :-------------------: | :------: | ----------------------------------------------- | ------------------------------------------------ |
| FIN           |                     0 |      `0000 0001`      |  `0x01`  | Finish — sender has no more data                | connection close (last packet from one side)     |
| SYN           |                     1 |      `0000 0010`      |  `0x02`  | Synchronize — initiate connection (seq sync)    | seen in handshake (SYN, SYN+ACK)                 |
| RST           |                     2 |      `0000 0100`      |  `0x04`  | Reset — abort connection immediately            | error or unexpected port/service                 |
| PSH           |                     3 |      `0000 1000`      |  `0x08`  | Push — deliver data to application promptly     | used for interactive data / small writes         |
| ACK           |                     4 |      `0001 0000`      |  `0x10`  | Acknowledgement field is significant            | almost every packet after handshake              |
| URG           |                     5 |      `0010 0000`      |  `0x20`  | Urgent pointer field significant                | rare; marks urgent data                          |
| ECE           |                     6 |      `0100 0000`      |  `0x40`  | ECN-Echo — congestion notification echo         | used for ECN-capable hosts/routers               |
| CWR           |                     7 |      `1000 0000`      |  `0x80`  | Congestion Window Reduced — sender reduced cwnd | used with ECN to signal congestion handled       |
| NS (optional) | 8 (above 8-bit flags) | `1 0000 0000` (9-bit) |  `0x100` | Nonce Sum — experimental ECN nonce bit          | lives in reserved/NS bit (RFC 3540); seldom used |
