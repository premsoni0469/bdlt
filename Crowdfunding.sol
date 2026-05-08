// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fund {
    uint public goal = 5 ether;
    uint public total;
    mapping(address => uint) public donation;

    function donate() public payable {
        donation[msg.sender] += msg.value;
        total += msg.value;
    }

    function refund() public {
        require(total < goal, "Goal reached");

        uint amount = donation[msg.sender];
        donation[msg.sender] = 0;
        total -= amount; // Subtract the refunded amount from total

        payable(msg.sender).transfer(amount);
    }
}