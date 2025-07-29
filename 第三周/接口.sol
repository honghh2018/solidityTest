//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


//假设没有Counter合约的代码，如何去调用呢？
// contract Counter{
//     uint256 public count;
//     function increment() external {
//         count +=1;
//     }
// }

//不需要知道其他合约的具体实现逻辑，通过接口调用其他合约，接口.sol调用接口1.sol的合约 

//用interface去定义接口
//规范是大写的I加合约名字
interface ICounter {
    //定义函数签名 
    function count()external view returns(uint);
    function increment() external ; 
}


contract MyContract{
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCounter(address _counter) external view returns (uint256){
        return ICounter(_counter).count();
    }


    
}

// contract MyContract{
//     function incrementCounter(address _counter) external {
//         Counter(_counter).count();
//     }


    
// }
