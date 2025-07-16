pragma solidity ^0.8.0;



contract  ValueType {
    bool public b=true;
    uint public u=123;
    int public i =-123;
    int public minInt=type(int).min; //获取最小值
    int public maxInt=type(int).max; //获取最大值
    address public addr = address(0xB9C83dF2Ec1);
    // bytes32 public b32 = 0xB924141542240000000000000000000000000000000000000000000;
}



