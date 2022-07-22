## Governance Transactions Note

The governance transactions under `initial-governanceTransactions.json` were executed on the Governor chain, Rinkeby, at [this transaction](https://rinkeby.etherscan.io/tx/0x8e784789482138d624d3fd2d81e306b7f1a81c99150e54fac6fab1727157fa84). 

This did the following: 
- enroll the Replica for `polygonmumbai` to the Rinkeby `xAppConnectionManager`.
- enroll the Watcher for `polygonmumbai` to the Rinkeby `xAppConnectionManager`.
- dispatch Nomad message to `goerli` to enroll `polygonmumbai` Replica & Watcher remotely.
- dispatch Nomad message to `evmostestnet` to enroll `polygonmumbai` Replica & Watcher remotely.

Upon running the deploy checks, it was discovered that there was an edge case in the deploy script which didn't properly handle the case when a deploy with the same domain had already been enrolled. This bug was fixed in [this PR](https://github.com/nomad-xyz/monorepo/pull/399/files).

The deploy script was re-run, which generated the governance transactions under `fixed-governanceTransactions.json`, which were executed on the Governor chain, Rinkeby, at [this transaction](https://rinkeby.etherscan.io/tx/0x49dd5779299bab9ac275038b29c811158e8d6cafdb5eb9fd5e494626327a124f).

This did the following:
- enroll the GovernanceRouter for `polygonmumbai` to the Rinkeby `GovernanceRouter`.
- enroll the BridgeRouter for `polygonmumbai` to the Rinkeby `BridgeRouter`.
- dispatch Nomad message to `goerli` to enroll `polygonmumbai` Replica, Watcher, GovernanceRouter, and BridgeRouter remotely.
- dispatch Nomad message to `evmostestnet` to enroll `polygonmumbai` Replica, Watcher, GovernanceRouter, and BridgeRouter remotely.

The remote transactions within `fixed-governanceTransactions.json` are a superset of the remote transactions within `initial-governanceTransactions.json`. The remote transactions within `initial-governanceTransactions.json` were never executed. The remote transactions under `fixed-governanceTransactions.json` will be executed, completing the process. 
