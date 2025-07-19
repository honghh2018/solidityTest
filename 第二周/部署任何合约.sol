//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;





contract TestContract1{
    address public owner = msg.sender;
     
     function setOwner(address _owner) public {
       require(msg.sender ==owner,'not owner');
       owner = _owner;
     }





}



contract TestContract2{
    address public owner = msg.sender;
    uint256 public value=msg.value;
    uint256 public x;
    uint256 public y;
    constructor(uint256 _x,uint256 _y) payable {
        x=_x;
        y=_y;
    }
}

//可以部署任意上面的合约  TestContract1 和TestContract2
contract Proxy{
    event Deploy(address);

    receive() external payable {}   //用来接收返回的以太

    function deploy(bytes memory _code) 
    external payable  //调用payable的时候可以转一些以太
    returns (address addr)   //返回合约地址
    {
         //部署任何合约需要用到内联汇编
         // 跳过前3个字节 0x20
         assembly{
            addr :=create(callvalue(),add(_code,0x20),mload(_code))
         }
         require(addr!=address(0),"deploy failed");
         emit Deploy(addr);   //把地址发送出去
    }

     function execute(address _target,bytes memory _data) external payable {
        // (bool success,)=_target.call(value:msg.sender)(_data);
        (bool success,)=_target.call{value:msg.value}(_data);
        require(success,"failed");
     } 


}


contract Helper{
    function getBytecode1() external pure returns (bytes memory){
        bytes memory bytecpde= type(TestContract1).creationCode;
        return bytecpde;
    }


    function getBytecode2(uint256 _x,uint256 _y)
    external pure 
    returns (bytes memory){
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode,abi.encode(_x,_y));
    }

  function getCallData(address _owner) external pure returns (bytes memory){
    return abi.encodeWithSignature("setOwner(address)", _owner);
  }

}

