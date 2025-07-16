pragma solidity ^0.8.0;


contract solidityFunction{
     
     function add(uint x,uint y) external pure returns(uint){
        return x+y;
     }  
     
     //只读函数
     function sub(uint x,uint y) external pure returns(uint){
            return x-y;
     }



}


