// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MyCrypto {

    string public name = "MyCoin";
    string public symbol = "MC";
    uint8 public decimals = 0;

    uint public totalSupply = 1000;

    mapping(address => uint) public balanceOf;

    event Transfer(
        address indexed from,
        address indexed to,
        uint value
    );

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint value)
    public returns(bool)
    {
        require(
            balanceOf[msg.sender] >= value,
            "Insufficient Balance"
        );
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}

