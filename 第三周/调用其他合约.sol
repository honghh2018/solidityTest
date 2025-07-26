//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;




contract Caller {
//    function setX(address _test,uint _x) external {
//      TestContract1(_test).setX(_x);  //完成链上TestContract1 的setX调用
//    } 
  //也可以这样写
function setX(TestContract1 _test,uint _x) external {
     _test.setX(_x);  //完成链上TestContract1 的setX调用
   } 
//    function getX(address _test) external view returns (uint) {
//     //  uint x =  TestContract1(_test).getX(); //得到另外一个合约的状态变量
//     //  return x;
//      return  TestContract1(_test).getX();
//    }
 function getX(address _test) external view returns (uint x) {
    //  uint x =  TestContract1(_test).getX(); //得到另外一个合约的状态变量
    //  return x;
     x=  TestContract1(_test).getX();
   }


   function setXandSendEther(TestContract1 _test,uint _x) external payable  {
     _test.setXandSendEther{value:msg.value}(_x);  //完成链上TestContract1 的setX调用
   } 


}


contract TestContract1{
    uint256 public x;
    uint256 public value=123;
    function setX(uint _x) public returns (uint256){
        x=_x;
        return x;
    } 
    function getX() external view returns (uint){
        return x;
    }

function setXandSendEther(uint256 _x) public payable returns (uint256,uint256){
    x=_x;
    value = msg.value;
    return (x,value);
}

function getXandValue() external view returns (uint,uint){
    return (x,value);
}


}