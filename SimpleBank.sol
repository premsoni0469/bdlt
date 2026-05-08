// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {

    mapping(address => uint) public balance;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(
            balance[msg.sender] >= amount,
            "Insufficient balance"
        );

        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function checkBalance() public view returns(uint) {
        return balance[msg.sender];
    }
}