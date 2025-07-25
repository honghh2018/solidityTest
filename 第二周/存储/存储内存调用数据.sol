//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


//storage 存储在链上
//memory 只能存储在内存上  刻度科协
// calldata 这个和内存很像，只能用来入参 只能读 更快
//stack 免费堆栈，和storage可以免费送gas
contract DataLocations{
     
     struct MyStruct{
        uint256 foo;
        string text;
     }
     mapping (address=>MyStruct) myStructs;
     //函数参数用memory
    //  function examples(uint[] memory x,string memory s) external  returns(MyStruct memory){
    //  function examples(uint[] memory x,string memory s) external  returns(uint[] memory){
        //calldata数据是不能被修改的
     function examples(uint[] calldata x,string calldata s) external  returns(uint[] memory){
        myStructs[msg.sender]=MyStruct({foo:123,text:"Hello World!"});
        MyStruct storage myStruct=myStructs[msg.sender];
        //这个  myStruct 就是状态变量了
        myStruct.text='bar';
        //只读的话
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo=456; //只在内存上修改

     

        // return readOnly;
        
        //直接把y给到函数，不修改，如果是memory的，内存会复制一份y，消耗gas
         _internal(y);


        uint[] memory memArr = new uint[](3);
        memArr[1]=234;
        return memArr;

     }

     function _internal(uint[] calldata y) private {
        uint x=y[0];
     }



}