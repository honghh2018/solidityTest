//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//private  只能合约内部调用
//public 外部可以调用
//external  只能外部调用，子合约不能调用
//internal  合约内部调用和子合约调用



contract Base{
    uint private x=0;
    uint internal y=1;
    uint public z=2;

    function privateFun() private pure returns(uint){
       return 0;
    }
    function internalFunc() internal pure returns(uint){
       return 100;
    }

    function publicFunc() public pure returns(uint){
        return 200;
    }


    function externalFunc() external pure returns(uint){
        return 300;
    }

    function examples() external view {
        //可以调用x,y,z
        x + y+z;
        privateFun();
        internalFunc();
        publicFunc();
        //不能调用externalFunc,只能外部调用
        // externalFunc(); 
        //强制访问的话，使用this
        // this.externalFunc(); //不推荐的写法

    }



}


contract Child is Base{

   function example1() external view {
      //无法调用private的x
      //内部和子合约能调用internal
      y+z;
      internalFunc(); //可以访问
      publicFunc(); //可以访问
   }


}
