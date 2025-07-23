//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;




contract S{
    string public name;
    constructor(string memory _name){
        name = _name;
    }
}

contract T{
    string public text;
    constructor(string memory _text){
        text = _text;
       
    }
}

//可以直接传入入参，第一种方式，在写合约的时候，就知道构造函数入参是什么
contract U is S('S'),T('T'){
    //如何调用父合约的构造函数呢？

}

//第二种

contract V is S,T{
    constructor(string memory _name,string memory _text) S(_name) T(_text){

    }
}


//两种结合
contract TT is S('S'),T{
    constructor(string memory _text)T(_text){

    }
}

//执行顺序和S(_name) T(_text)  两个没关系和 继承顺序有关系  S,T
// 先S，T后V1
contract V1 is S,T{
    constructor(string memory _name,string memory _text) T(_text) S(_name) {

    }
}

