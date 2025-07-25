//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



//3 way to send eth
//tranfer 2300 gas 发送失败会revert退回
//send 2300 gas return bool
//call all gas returns bool or data //转出所有的gas


contract  Sendether{
    constructor(){}
    // fallback() external payable { }
    //只接收msg.data为空的时候的
    receive() external payable { }
}

