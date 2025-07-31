//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//库的学习，库不能拥有自己的状态变量，名字首字母大写

library Math{
    //internal的只是内部给testMax合约的调用
    //internal部署的时候，直接内嵌到 testMax合约上，不用单独去部署
    function max(uint x,uint y) internal pure returns (uint){
        return x >= y ? x : y;
    }

}


//写一段代码在不停地方使用他

contract Test{

    function testMax(uint x, uint y) external pure returns (uint){
        //调用library,其他合约也可以调用max
        return Math.max(x,y);
    }
}


library  ArrayLib{
    function find(uint [] storage arr,uint x) internal view returns(uint){
        for(uint i=0;i<arr.length;i++){
            if(arr[i]==x){
                return i;
            }
        }
        //循环完还找不到的 revert
        revert("not found");
    }
}


contract TestArray{
    using ArrayLib for uint[];  //增强数组，给数组加find方法，调用声明库中的所有函数
    uint[] public arr=[3,2,1];
    function testFind() external  view returns(uint){
        //状态变量，直接传入就行
        //  return  ArrayLib.find(arr,2);
        return arr.find(2);
    }
}

