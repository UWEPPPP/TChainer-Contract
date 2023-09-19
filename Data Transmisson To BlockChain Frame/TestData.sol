// SPDX-License-Identifier: MIT
pragma solidity >=0.6.1 <=0.8.11;

contract TestData {
    //用于execute函数
    uint8 constant INSERT =2;
    uint8 constant UPDATE =1;
    
    uint256  latestIndex;


    //数据模板
    struct Data{
        uint256 id;
        uint256 verison;
        uint256 createdAt;
        uint256 updatedAt;
    }
    
    //执行事件
    event executeEvent(Data);

    //记录每一个创建的数据 
    mapping(uint256 => Data) table;

    //记录每个结构体的最新块高
    mapping(uint256 => uint256) blockHeight;

    //get方法 
    function get(uint256 id) public view returns (Data memory){
        return   table[id];
    }    
    
    //getAll方法
    function getAll () public view  returns  (Data[] memory) {
         Data[] memory datas = new Data[](latestIndex);        
         for(uint256 i = 0;i<=latestIndex;i++){
               datas[i]=(table[i]);
        }
        return datas;
    }

    function execute (string[] memory args) public pure returns (bool){
        uint256 length = args.length;
        if (length == )
        

        return  true;
    }

}
