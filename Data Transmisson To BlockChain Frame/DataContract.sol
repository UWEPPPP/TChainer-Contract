// SPDX-License-Identifier: MIT
pragma solidity >=0.6.10 <0.8.11;
abstract contract DataContract {

    /**
    * @param id 数据id
    **/
    function get(uint256 id) public virtual returns (bytes memory);
   

}