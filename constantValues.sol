//SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;

contract ConstantValue{
    //这个是常量   
    //常亮能减少gas   能节省手续费
    address public constant MY_ADDRESS=address(1);  //373 gas
    uint public constant MY_UINT=123;

}


contract Vars{
    //这个是变量    2485 gas
    address public MY_ADDRESS=address(2);  
}