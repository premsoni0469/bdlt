// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Subscription {

    mapping(address => uint) public expiry;

    // Subscribe for 3 minutes
    function subscribe() public payable {

        require(msg.value > 0, "Pay ETH");

        expiry[msg.sender] = block.timestamp + 3 minutes;
    }

    // Check subscription status
    function isActive(address user) public view returns(bool) {
        return block.timestamp < expiry[user];
    }
}