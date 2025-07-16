//SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;




contract forWhileLoops{
    function loops() external pure {
        for(uint i=0;i<10;i++){
            //跳过某次循环
            if(i==3){
               continue;
            } 
            //more code
            //跳出循环
            if(i==5){
                break ;
            }
            
        }

       uint j=0;
       while(j==10){
           //code
           j++;
       }

    }

    function sum(uint _n) external pure returns (uint) {
        //循环越多 gas越多，手续费越贵
       uint s;
           for(uint i=1;i<=_n;i++){
             s +=i;
           }
       return s;

    }


}