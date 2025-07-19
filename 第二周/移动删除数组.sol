//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract arrayShift {
    uint256[] public arr;

    function examples() public {
        arr = [1, 2, 3];
        delete arr[1]; //[1,0,3]
    }

    function remove(uint256 _index) public {
        require(_index<arr.length,'index out of bound');
        for(uint i=_index;i<arr.length-1;i++){
            arr[i]=arr[i+1];
        }
        arr.pop();
    }

function test()external {
    arr=[1,2,3,4];
    remove(2);
    //[1,2,4]
    assert(arr[0]==1);
    assert(arr[1]==2);
    assert(arr[2]==3);
    assert(arr[3]==4);
   arr=[1];
   remove(0);
   assert(arr.length==0);




}

}
