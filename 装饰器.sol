//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract functionModifier {
    bool public paused;
    uint256 public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // function inc() external {
    //     require(paused,'puased'); 、//这里的 的代码一模一样，可以用装饰器做
    //     count +=1;
    // }
    // function dec() external {
    //     require(!paused,'paused');
    //     count +=1;
    // }
    
    //这里就是装饰器
    modifier whenNotPaused() {
        require(paused, "puased");  //执行装饰器代码
        _;   // count += 1;  代表函数的原来代码
    }

    function inc() external whenNotPaused{
        count += 1;
    }

    function dec() external  whenNotPaused{
        
        count += 1;
    }
}
