//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;




contract B{
    //状态变量必须完全一样，否者出现奇怪的结果
    // string public owner;  //如这个、  不加在这个位置加在底部是可以的
    uint256 public num;
    address public sender;
    uint256 public value;
    // string public owner;
    function setVar(uint256 _num ) public payable {
        // num=_num;
        num=2*_num;
        sender=msg.sender;
        value=msg.value;
    }
}


contract A{
    //A合约想去代理调用B合约的 setVar函数
    uint256 public num;
    address public sender;
    uint256 public value;
    function setVars(address _contract,uint256 _num) public payable {
        //代理调用,字符串的方式
        // _contract.delegatecall(
        //     abi.encodeWithSignature("setVar(uint256)", _num);
        // )
        //第二种,不用写死
       (bool success,bytes memory data) = _contract.delegatecall(abi.encodeWithSelector(B.setVar.selector, _num));
        require(success,'call failed');

    }
}