# faultySol

faultySol is a collection of vulnerable solidity contracts. Helpful for training and testing offensive tools against it. 

## secrets.sol

Contract that stores secret strings in an insecure manner. EVM storage is not private. Storage slots can be accessed even without access to the abi. Example tool: (https://github.com/HackingWeb3/ETHstorageDump)[https://github.com/HackingWeb3/ETHstorageDump]