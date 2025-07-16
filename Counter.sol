//SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;


contract Counter{
    uint public count;
     
     //他不是view也不是pure,view是只读，这里还能写
    function inc() external {
        count +=1;
    }
    function dec() external {
        count -=1;
    }


}
