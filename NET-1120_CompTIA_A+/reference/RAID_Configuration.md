
| **RAID Level**    | **Min. Drives Needed** | **Striping**           | **Mirroring** | **Parity**          | **Notes / Usage**                                                                                      |
| ----------------- | ---------------------- | ---------------------- | ------------- | ------------------- | ------------------------------------------------------------------------------------------------------ |
| **RAID 0**        | 2                      | ✅ Yes                  | ❌ No          | ❌ No                | High performance (fast read/write), but **no fault tolerance** (if 1 drive fails, all data is lost).   |
| **RAID 1**        | 2                      | ❌ No                   | ✅ Yes         | ❌ No                | Provides redundancy via mirroring, but halves usable storage (50%).                                    |
| **RAID 5**        | 3                      | ✅ Yes                  | ❌ No          | ✅ Yes (distributed) | Balances performance, storage efficiency, and fault tolerance. Can survive 1 drive failure.            |
| **RAID 6**        | 4                      | ✅ Yes                  | ❌ No          | ✅ Yes (dual)        | Like RAID 5, but with double parity → can survive 2 drive failures.                                    |
| **RAID 10 (1+0)** | 4 (must be even)       | ✅ Yes (across mirrors) | ✅ Yes (pairs) | ❌ No                | Combines striping + mirroring. High performance **and** fault tolerance, but only 50% usable capacity. |
