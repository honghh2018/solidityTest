//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



contract Mapping{
    //和python字典差不多
    mapping (address=>uint) public balances;
    //嵌套mapping
    mapping (address=>mapping (address=>bool)) public isFriend;


    function examples() external  {
            balances[msg.sender]=123;
            //获取
           uint bal= balances[msg.sender];
           //可以获取一个没有赋值的地址的值
           uint bal2 =balances[address(1)]; //默认值0
           //更新
        //    balances[msg.sender]=456;
           balances[msg.sender] +=456; //123 + 456
           delete balances[msg.sender]; //变成默认值 0

            //这个合约的朋友
            isFriend[msg.sender][address(this)]=true;

    }


}