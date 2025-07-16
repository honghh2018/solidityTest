//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;




contract Constructor{
    address public owner;
    uint public x;
    constructor(uint _x){
        //msg.sender就是部署合约的账号地址
        //初始化owner ,只能部署的时候执行一次
       owner = msg.sender;
       x=_x;
    }
}