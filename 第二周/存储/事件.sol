//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//事件类似log, 存储后不能在智能合约上获取他,相当于一次性的，比我们的状态变量更加便宜
//如果想一次性的记录一些事情就用event


contract Event{
    //最多index的3个，选择最重要的三个加index就行
     event Log(string message,uint val);
     //加上index,我们就能根据index查找
     event IndexLog(address indexed sender,uint val);
     //发出事件
     function example() external {
        //发送事件
        emit Log("foo",1234); //调用那么就记录在链上
        emit IndexLog(msg.sender, 10);
     }

     event Message(address indexed _from , address indexed _to, string _message);
     function sendMessage(address _to,string calldata message) external {
        //可以给任意一个地址发送我们的信息，并记录在链上
        emit Message(msg.sender, _to, _message);
     }

}

