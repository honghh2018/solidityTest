//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;





contract E {
    event Log(string message);
    function foo() public  virtual  {
       emit Log('foo');
    }
    function bar() public virtual {
        emit Log('bar');
    }
}

contract F is E{
    function foo() public virtual override {
        emit Log('foo F');
        //直接调用
        E.foo();
    }
    function bar() public  virtual override {
        emit Log('bar F');
        super.bar();  //可以用super关键字调用
    }
}

//当多继承的时候，super和 直接调用就不一样了


contract U is F,E{
    super.bar();
    F.bar();
    //他们不一样
}


