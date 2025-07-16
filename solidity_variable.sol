pragma solidity ^0.8.7;

contract statusVariable {
    //状态变量是存储到区块链上的，她一直会存储在区跨链上(放在合约内部，函数的外部)
    // uint public  myUint;
    // uint256 public i = 123;
    uint256 public i;
    bool public myBool1 = true;
    address public myAddress = address(0x64dE952);  

    function foo() external {
        uint myfoo = 123; //这个是局部变量，函数执行完就消失
        bool mybool = true;
        myfoo += 10;
        mybool = false;
        //   myAddress.transfer(5);  //这个是合约方法，函数执行完就消失

        //改变全局变量
        i = 77;
        myBool1 = false;
        myAddress=address(1);
    }
}
