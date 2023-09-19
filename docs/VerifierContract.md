# Solidity API

## VerifierContract

权限控制合约

### Contract
VerifierContract : Data Transmisson To BlockChain Frame/VerifierContract.sol

 --- 
### Modifiers:
### onlyAdmin

```solidity
modifier onlyAdmin()
```

 --- 
### Functions:
### constructor

```solidity
constructor() public
```

### register

```solidity
function register(address addr) public returns (bool)
```

注册

### setChainer

```solidity
function setChainer(address addr) public returns (bool)
```

### checkAdmin

```solidity
function checkAdmin(address addr) public view returns (bool)
```

### checkChainer

```solidity
function checkChainer() public
```

