//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



//call是比较底层的调用


contract TestCall{
    string public message;
    uint public x;
    event Log(address caller,uint256 amount,string message);
    receive() external payable { }
    fallback() external payable {
        emit Log(msg.sender,msg.value,"fallback was called");
     }

    function foo(string memory _message,uint _x) public payable returns (bool,uint){
        message = _message;
        x=_x;
        return (true,999);
    }

}


contract Call{
bytes public data;

    //接收test合约的地址
    function callFoo(address _test) external payable  {
        //调用test合约的任何函数,比较底层
        //能同时发送以太
        // (bool success, bytes memory data)=_test.call(abi.encodeWithSignature("foo(string,uint256)", "call foo",123));

        //发送111个以太，只允许消耗gas 5000,这里是不够的
        // (bool success, bytes memory _data)=_test.call{value:111,gas:5000}(abi.encodeWithSignature("foo(string,uint256)", "call foo",123));
        (bool success, bytes memory _data)=_test.call{value:111}(abi.encodeWithSignature("foo(string,uint256)", "call foo",123));
        require(success,"call failed");
        data=_data;
    }


function callNotExists(address _test) external {
    //调用不存在的函数 触发fallback

    (bool success,) = _test.call(abi.encodeWithSignature("doesNotExist()"));
     require(success,"call failed");
}

}