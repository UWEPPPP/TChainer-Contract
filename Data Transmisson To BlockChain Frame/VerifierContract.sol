// SPDX-License-Identifier: MIT
pragma solidity >=0.6.10 <0.8.11;

/**
权限控制合约
**/
contract VerifierContract {
    /**
    默认用户 0   无权限
    普通用户 1 基础权限
    上链用户 2 上链权限
    管理员   3 所有权限
    **/
    enum Role {
        Default,
        Common,
        Chainer,
        Admin
    }

    //存储身份
    mapping(address => uint8) private users;

    //设置管理员
    constructor(address admin) {
        users[admin] == 2;
    }

    /**
     *@param addr 视图赋予权限者的地址
     *@param role 赋予的权限等级
    **/
    function checkPermission(address addr,Role role) internal view returns (bool) {
        if (users[addr] != uint8(role)) {
            return false;
        }
        return true;
    }

    /**设置权限
     *@param addr 被赋予权限者的地址
     *@param role 被赋予的权限等级
     **/
    function setRole(address addr, uint8 role) public {
        if (role == uint8(Role.Common)) {
            users[addr] = uint8(Role.Common);
        }
        if (role == uint8(Role.Chainer)) {
            if (checkPermission(msg.sender,Role.Admin)) {
                users[addr] = uint8(Role.Chainer);
            }
        }
    }
    
    /**删除权限
     *@param addr 被删除权限者的地址
    **/
    function removeRole(address addr) public {
        if(checkPermission(msg.sender,Role.Admin)){
            users[addr]=uint8(Role.Default);
        }
    }
    
    /**查看权限
    *@param addr 查看权限的地址
    **/
    function checkRole(address addr) public view returns (uint8) {
        return users[addr];
    }
    
}
