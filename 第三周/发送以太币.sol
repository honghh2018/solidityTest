//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



//3 way to send eth
//tranfer 2300 gas 发送失败会revert退回
//send 2300 gas return bool
//call all gas returns bool or data //转出所有的gas

//发送以太币
contract  Sendether{
    constructor() payable {}
    // fallback() external payable { }
    //只接收msg.data为空的时候的
    receive() external payable { }

    function sendViaTransfer(address payable _to) external payable{
        _to.transfer(123); //可以往这个_to地址发送以太币，如果失败了会revert掉，回退
    }

    function sendViaSend(address payable _to) external payable {
        //这种很少使用，一般是transfer和call
        bool sent =  _to.send(123);  //这个会返回一个bool变量,判断是否成功
        require(sent,'send failed');
    }
    function sendViaCall(address payable _to) external payable {
        //空值，那么没有定义receive的话会调用fallback
      (bool success,) =  _to.call{value:123}("");  //这个的写法比较奇怪，发送的值是花括号的123
      require(success,'call failed');
    }

}


contract EtherReciver{
    event Log(uint amount,uint gas);
    receive() external payable { 
        //发送多少，消耗多少gas，打印日志出来
        emit Log(msg.value,gasleft());
    }
}