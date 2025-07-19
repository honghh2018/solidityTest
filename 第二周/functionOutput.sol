//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



contract functionOutput{
    function returnMany() public pure  returns(uint,bool){
        return (1,true);
    }

    //返回命名
    function returnMany1() public pure  returns(uint x,bool b){

        return (1,true);
    }

     //返回命名
    function returnMany2() public pure  returns(uint x,bool b){
        //不需要return
        x=1;
        b=true;
    }

    //获取多个输出

    function destructAssign() public pure {
        // (uint x,bool b)=returnMany();
        //只要第二个不要第一个
        (,bool b)=returnMany();

    }

}