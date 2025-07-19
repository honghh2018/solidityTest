//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;




contract Ownable{
    address public owner;
    constructor(){
        owner = msg.sender;

    }

    modifier onlyOwner(){
        require(msg.sender==owner,'only owner');
        _;
    }

    function setOwner(address _newOwner) external onlyOwner{
        //不能设置为全零地址
        require(_newOwner!=address(0),'invalid address');
        owner=_newOwner;
    }
    
    function onlyOwnerCallFunc() external onlyOwner{
        //code
    }
    function anyCallFunc() external {
        //code
    }


}