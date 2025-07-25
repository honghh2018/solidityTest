//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


//回调函数fallback

//receive没有定义会调用fallback
contract Fallback{
    //类似web2的websocket,消息弹窗
    event Log(string func,address sender,uint value,bytes data);

    //当我们调用合约不存在的函数的时候，这个fallback函数就会被执行
//    fallback() external  { }
   fallback() external payable  {
    //别人调合约中的函数，没有，触发fallback函数，调用逻辑合约，类似callback
      emit Log("fallback",msg.sender,msg.value,msg.data);
    }   //会接收以太

//    //还有一种接收以太的方法
//    receive() external payable { 
//     //msg.data 空的时候才会执行receive
//     emit Log('receive',msg.sender,msg.value,"");
//    }  //这个
 }

