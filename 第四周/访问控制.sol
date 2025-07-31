//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;




contract AccessControl{
    //发送一个事件，设置indexed容易查找,
    event GrantRole(bytes32 indexed role, address indexed account); 
    event RevokeRole(bytes32 indexed role,address indexed account); //取消
    //为什么不用字符串，因为可以省一些gas，并且hash后都是32位的
    mapping (bytes32 =>mapping (address=>bool)) public roles;
    bytes32 private constant ADMIN=keccak256(abi.encodePacked("ADMIN"));
    bytes32 private constant USER=keccak256(abi.encodePacked("USER"));
    // admin 0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    // bytes32 public  constant ADMIN=keccak256(abi.encodePacked("ADMIN")); //部署的时候先改成public,拿到他的地址
    // user 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    // bytes32 public  constant USER=keccak256(abi.encodePacked("USER"));

    //外部不是所有都能调用需要指定特定角色才能调用

    modifier onlyRole(bytes32 _role){
        //是否有这个角色，并且角色是否有权
       require(roles[_role][msg.sender],"not authrized");
       _;
    } 
    //到目前为止还没有一个admin角色，需要部署的时候初始化一个
    constructor(){
        //调用内部的grant函数，赋值管理员的权限，后续才能给其他的账号赋值角色
        _grantRole(ADMIN, msg.sender);
    }

    //编写函数，赋予我们地址的特定角色
    function _grantRole(bytes32 _role,address _account) internal{
        roles[_role][_account]=true; //这个地址这个角色 设置位true就确定他是这个角色了
        emit GrantRole(_role, _account);
    } 

    //只有ADMIN的地址才能调用 grantRole 函数
    function grantRole(bytes32 _role,address _account) external onlyRole(ADMIN){
        _grantRole(_role,_account);
    }

   function revokeRole(bytes32 _role,address _account) external onlyRole(ADMIN){
     roles[_role][_account]=false;
     emit RevokeRole(_role, _account);
   }



}