//SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;

contract viewAndPureFunction {
    uint256 public num;

    //view函数能读取区块链上的状态变量，num,null 只能读取不能写入
    function viewFunc() external view returns (uint256) {
        return num;
    }

    function pureFunc() external pure returns (uint256) {
        //内置的pure函数，
        return 4;
    }

    function addToNum() external view returns (uint256) {
        return num + 1;
    }
    

    //没有读取任何区块链上的数据是pure函数
    function add(uint x,uint y) external pure returns (uint){
        return x+y;
    }


}
