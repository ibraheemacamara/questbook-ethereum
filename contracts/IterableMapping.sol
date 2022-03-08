// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function insert(address _key, uint _val) external {
        if(!inserted[_key]){
            balances[_key] = _val;
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns(uint) {
        return keys.length;
    }

    function first() external view returns(uint) {
        return balances[keys[0]];
    }

    function last() external view returns(uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint i) external view returns(uint) {
        return balances[keys[i]];
    }
}