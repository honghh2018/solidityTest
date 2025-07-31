//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//签名和验签


//首先是准备信息
//第二是  keccak256
//线下过程，拿私钥对message进行签名
//链上签名加erc进行验证


contract VerifySig{
    function verify(address _signer,string memory _message,bytes memory _sig) external pure returns(bool){
        bytes32 messageHash = getMessageHash(_message); 
        //eth链上进行的hash
        bytes32 ethSignerMessageHash = getEthMessageHash(messageHash);
        //solidity自带的 recover
        return recover(ethSignerMessageHash,_sig) == _signer;
    }

   function getMessageHash(string memory _message) public  pure returns(bytes32){
         return keccak256(abi.encodePacked(_message));
   }

   function getEthMessageHash(bytes32 _messageHash) public  pure returns(bytes32){
    //append一个字符串，识别是以太网 上的签名   
            return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",_messageHash)); //为什么要加一段字符串？
   }

   function recover(bytes32 _etherSignedMessageHash,bytes memory _sig ) public pure returns(address){
    (bytes32 r,bytes32 s,uint8 v)= _split(_sig);
    return ecrecover(_etherSignedMessageHash, v, r, s);
   } 

   function _split(bytes memory _sig) internal  pure returns(bytes32 r,bytes32 s,uint8 v){
    require(_sig.length==65,"invalid signature length");
    //  r :=mload(add(_sig,32)) 跳过32位字节
    assembly{
        r :=mload(add(_sig,32))
        s :=mload(add(_sig,64))
        v :=byte(0,mload(add(_sig,96)))
    }

   }

  


}

//网页的console.log调用
// ethereum.enable()
//ethereum.request({method:"personal_sign",params:[account,hash]})
