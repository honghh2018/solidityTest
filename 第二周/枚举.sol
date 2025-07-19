//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Enum {
    //Enum的默认值是他第一个定义的值，删除后
    enum Status {
        None,    //0   //reset后变成0，也就None
        Pending,  //1
        Shipped, //2
        Completed, //3
        Rejected, //4
        Canceled //5
    }
    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    function get() external view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status=Status.Shipped;
    }

    function reset() external {
        //重置
        delete status;
    }



}
