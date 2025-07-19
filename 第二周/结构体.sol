//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



contract Structs{
    struct Car{
         string model;
         uint year;
         address owner; 
    }

    Car public car; //变量
    Car[] public cars; //数组
    mapping(address=>Car[]) public carsByOwner; //映射  

    //struct初始化
    function examples()external {
        //第一种赋值
        Car memory toyota = Car('Toyota',1990,msg.sender);
        //第二种赋值
        Car memory lambo = Car({year:1990,model:'lambojini',owner:msg.sender});
        Car memory tesla;
        tesla.model='Tesla';
        tesla.year=2020;
        tesla.owner=msg.sender;
        //他们都是内存中的，如何推到状态变量中呢？
        //如下
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);
        //这种也行
       cars.push(Car('Ferraris',2021,msg.sender)); 

        //拿到数组中的第一辆车
       Car memory _car = cars[0];
       //读取值
       _car.model;
       _car.owner;
       _car.year;
       //更新 (在链上的修改)，能保存下来
        Car storage _car1=cars[0];
       _car1.year=1998; 

        //删除
        delete _car1.owner;
        //删除所有字段
        delete  cars[1]; //重置为默认值

    }
 

}