// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract SimpleStringStorage {
    string text;
    
    //27318 gas 
    function setWithMemory(string memory _text) external {
        text = _text;
    }
    //26880 gas 
    function setWithCalData(string calldata _text) external {
        text = _text;
    }

    function get() external view returns(string memory) {
        return text;
    }
}