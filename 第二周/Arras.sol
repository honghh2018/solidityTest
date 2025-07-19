//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



contract Arrays{
    // uint[] public nums; //动态长度数组
    uint[] public nums=[1,2,3]; //动态长度数组
    // uint[3] public fixedNum;// 固定长度数组
    uint[3] public fixedNum=[1,2,3];// 固定长度数组

    function examples() external {
        // nums.push(4);  //添加数组，[1,2,3,4]
        uint x = nums[1];//获取
        //更新
        // nums[1]=77; //[1,77,2]
        //删除
        // delete nums[1]; //只是第二位变为默认值0，长度还是3
        //长度变化的
        // nums.pop();  //后面一位被删除  [1,77]
        //获取长度
        uint len =nums.length;
        //创建一个内存数组
        uint[] memory a = new uint[](5); // 内存中创建一个固定长度的数组，不能创建动态数组，不能用pop

        a[1]=123; //只能更新 

    }

    function returnArry() external view returns(uint[] memory){
        //return数组不建议，消耗gas
        return nums;
    }



}