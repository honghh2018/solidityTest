//SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;



contract defaultValue{
    address public owner; //默认是全0 0x0000000000000000000000000000000000000000
    bool public b;  //默认是false
    uint public u; //默认是0
    int public i; //默认值0
    bytes32 public b32; //默认值也是0     0x0000000000000000000000000000000000000000000000000000000000000000


    function testDefault() public  view returns (address,bool, uint, int,bytes32){
        return (owner,b,u,i,b32);
    } 




}