//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract IterMaping {
    mapping(address => uint) public balances;
    //有地址插入记录mapping,插入就是true
    mapping(address => bool) public inserted;

    address[] public keys;

    function set(address _key, uint _val) external {
        balances[_key] = _val;
        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {
        //获取第一个地址
        return balances[keys[0]];
    }

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint _i) external view returns (address) {
        return keys[_i];
    }
}
