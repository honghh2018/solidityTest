//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


// 30444 gas immutable
// 52565 gas 非 immutable
contract Immutable{
    //定义的时候初始化不能再改变，变成常量，会省gas
    // address public immutable owner = msg.sender; //只能再部署的时候初始化，后面无法改他
    address public immutable owner; //只能再部署的时候初始化，后面无法改他
    // address public owner = msg.sender;
    uint public x;
    constructor(){
        owner = msg.sender;
    }



    function foo()external {
        require(msg.sender==owner);
        x +=1;
    }
}