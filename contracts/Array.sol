// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Array {
    uint[] public arr;
    function example() public {
        arr = [1, 2, 3];
        delete arr[1]; // [1, 0, 3]
    }

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");
        //[1, 2, 3, 4] remove(1) ---> [1, 3, 4, 4] ---> [1, 3, 4]
        for(uint i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function testRemoveArray() external {
        arr = [1, 2, 3, 4];
        remove(1);
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 3);
        assert(arr[2] == 4);

        arr = [1];
        remove(0);
        assert(arr.length == 0);
    }
}