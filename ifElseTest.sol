//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract IfElse {
    function example(uint256 _x) external pure returns (uint256) {
        // if(_x <10){
        //     return 1;
        // }else if(_x<20){
        //     return 2;
        // }else{
        //     return 3;
        // }

        if (_x < 10) {
            return 1;
        } else if (_x < 20) {
            return 2;
        }
        return 3;
    }

   function tenary(uint _x) external pure returns (uint){
       //三元运算符
       return _x <10?1:2;
   }


}
