//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


//可以接收和发送以太

contract Payable{
    address payable public owner; //可以使用这个owner发送以太
    constructor(){
        //初始化,这里的msg.sender是address类型，但是上面的owner是payable的address类型
        // owner = msg.sender;
        owner = payable(msg.sender);  //要强转
        
    }
    // function receive() external payable { }
    //用户调用函数的时候，可以去接收以太 payable
    // function deposit() external payable {}   //直接定义就行？
    function deposit() external  {}   //直接定义就行？ 没有payable不行
    //查询余额
     
    function getBalance() external view returns (uint){
        return address(this).balance;   //这个是什么意思？
    }


}