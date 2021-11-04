ZRS -> Sync
GRS & RAGRS -> Async 

* Performance
  * Standard V2
    * Blobs/Queues/Tables/Files
    * Recommended most scenarios
  * Premimum
    * Block Blobs
      * Best for high transation rates and low latency
      * LRS & ZRS
    * Page Blobs
      * Best for random reads and writes
      * LRS
    * File shares
      * Best for enter prise or high performance that need scale.
      * LRS & ZRS      

    