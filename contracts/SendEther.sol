// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract SendEther {
    constructor() payable {

    }
    receive() external payable{

    }

    function sendViaTranfer(address payable _to) external {
        _to.transfer(123);
    }
    function sendViaSend(address payable _to) external {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }
    function sendViaCall(address payable _to) external {
        (bool success, )= _to.call{value: 123}("");
        require(success, "send failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);
    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}