//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



contract Etherwallet{
    address payable  public owner;
    constructor(){
        owner = payable(msg.sender);   //转成payable的地址
    }
    //使用 receive  函数确认这个合约就是用来接收以太的
    receive() external payable { }
    //定义一个函数，将以太还给owner
    function withdraw(uint _amount) external {
        require(msg.sender==owner, "caller is not owner");
        //以太打出去    （这里不是接收的吗怎么打出去了？）
        // owner.transfer(_amount);
        //使用内存的方法
        payable (msg.sender).transfer(_amount);
        //第二种方法
        // (bool sent,) = msg.sender.call{value:_amount}("");
        // require(sent,"tx failed");
    }

   function getBalance() external view returns (uint){
    return address(this).balance;  //查看余额
   }


}