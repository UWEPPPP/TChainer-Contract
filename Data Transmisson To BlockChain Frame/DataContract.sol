// SPDX-License-Identifier: MIT
pragma solidity >=0.6.10 <0.8.11;
abstract contract DataContract {

    /**
    * 获取数据
    * @param id 数据id
    **/
    function get(uint256 id) public virtual returns (bytes memory);

    /**
    * 更新数据
    * @param id 数据id
    * @param data 数据内容
    **/
    function set(uint256 id,bytes memory data) public virtual returns (bool);

    /**
    * 插入
    * @param data 数据内容
    **/
    function add(bytes memory data) public virtual returns (uint256);



}