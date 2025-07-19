//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ArrayReplaceList {
    uint256[] public arr;

    function remove(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4];
        remove(0); // [4,2,3]

        assert(arr.length == 3);
        assert(arr[0] == 4);
        assert(arr[1] == 2);
        assert(arr[2] == 3);
        //
        remove(2);
        assert(arr.length == 2);
        assert(arr[0] == 4);
        assert(arr[1] == 2);
    }
}
