//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//使用这种方法来做签名，发送给bob，message进行签名发送给bob
//使用公钥进行验签，如果发送的和接收的一样说明通过
contract HashFucn {
    function hash(
        string memory text,
        uint256 num,
        address addr
    ) external pure returns (bytes32) {
        //返回一个256位的值，入参是bytes32的类型
        return keccak256(abi.encodePacked(text, num, addr)); //转成bytes类型
        // abi.encode(arg);  //这个是不压缩的，packed的是压缩的
    }

    //测试一下
    function encode(string memory text0, string memory text1)
        external
        pure
        returns (bytes memory)   //这里为什么用bytes memory
    {
        return abi.encode(text0, text1);
    }

    function encodPacked(string memory text0, string memory text1)
        external
        pure
        returns (bytes memory)
    {
        return abi.encodePacked(text0, text1);
    }
    //防止哈希冲突

   function collision(string memory text0, string memory text1) external pure returns (bytes32){  //这里用bytes32?
        //   return keccak256(abi.encodePacked(text0,text1)); 
          //防止哈希冲突直接用encode
          return keccak256(abi.encode(text0,text1)); //还有一种是
   }

 function collision1(string memory text0,uint x, string memory text1) external pure returns (bytes32){  //这里用bytes32?
        //   return keccak256(abi.encodePacked(text0,text1)); 
          //防止哈希冲突直接用encode
          return keccak256(abi.encodePacked(text0,x,text1)); //还有一种是
   }


}
