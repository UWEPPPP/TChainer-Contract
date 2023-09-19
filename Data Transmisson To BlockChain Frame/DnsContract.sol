// SPDX-License-Identifier: MIT
pragma solidity >=0.6.10 <0.8.11;
import "Data Transmisson To BlockChain Frame/VerifierContract.sol";
contract DnsContract {
    VerifierContract  verifier;
    uint8 constant CHAINER_RIGHT = 2;

    //域名到地址的映射
    mapping(string => address) public domainToAddress;

    event InvokeResponse(bool success,bytes data);

    modifier OnlyChainer(){
        require(verifier.checkRole(msg.sender)< CHAINER_RIGHT,"NO RIGHT" );
        _;
    }

    constructor(address addr) {
       verifier = VerifierContract(addr); 
    }

    //注册域名
    function register(string memory domain, address addr) public OnlyChainer  {
       domainToAddress[domain] = addr; 
    }
    
    //执行方法
    function invoke(string memory domain,string memory method,string memory args) public returns (bytes memory) {
     (bool  success, bytes memory data) =domainToAddress[domain].call(abi.encodeWithSignature(method,args));
     emit InvokeResponse(success, data);
     return data;
    }


}
