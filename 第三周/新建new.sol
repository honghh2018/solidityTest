//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Account{
    address public bank;
    address public owner;
    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}


//工厂合约调用他生成Account合约
contract AccountFactory{
    //需要保存新合约的地址，需要申请一个状态变量
    Account[] public accounts;
    //有200以太打过来，111个以太到新的account合约上去 
     function createAccount(address _owner) external payable {  //改成payable接收以太
        //创建一个新的合约
        //因为是payable，所以新建的可以转一些以太过去
    //    Account account =  new Account(_owner);
    //转这个合约新的账户111个以太
       Account account =  new Account{value:111}(_owner);
       accounts.push(account);
     }
}