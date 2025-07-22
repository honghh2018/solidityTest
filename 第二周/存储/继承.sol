//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



contract A{
    //必须设置为virtual函数，B才能继承A
    function foo() public pure virtual returns (string memory){
          return 'A';
    }
    function bar() public pure virtual returns(string memory){
        return 'A';
    }


    function  baz()public pure returns (string memory){
        return 'A';
    } 


}


contract B is A{
    //继承过来改定义的，需要override
    function foo() public pure override  returns (string memory){
          return 'B';
    }
    function bar() public pure virtual  override  returns(string memory){
        return 'B';
    }
    //B也能调用  A的baz
}

contract C is B{
    //修改继承的函数
    function bar() public pure  override  returns(string memory){
        return 'C';
    }
}


