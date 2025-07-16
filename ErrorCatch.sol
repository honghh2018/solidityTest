//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Error {
    function testRequire(uint256 _i) external pure {
        require(_i <= 10, "i>10");
        //code
    }

    function testRevert(uint256 _i) external pure {
        //ifelse嵌套很多用revert,否者用require
        if (_i < 10) {
            revert("i>10");
        }

        if (_i < 10) {
            if (_i < 3) {
                if (_i < 1) {
                    revert("i<1");
                }
            }
        }
    }

    //assert用来确保代码执行一定是真的

    uint256 public num = 123;

    function testAssert() external view {
        //我们坚信合约中没有人修改123，如果不是的话就报错，断言报错，说明合约有bug
        assert(num == 123);
    }

    //这里会触发 assert
    function foo() public {
        num += 1;
    }

    //自定义错误，节省gas
    function testCustomError(uint256 _i) public pure {
        //错误信息越长消耗的gas越多
        require(_i < 10, "very long error msg long long long");
        //code
    }

    //自定义error
    error myError(address caller,uint i); 

    function testCustomError1(uint256 _i) public view {
        //错误信息越长消耗的gas越多
       if(_i<10){
        revert myError(msg.sender,_i);
       }
        //code
    }
}
