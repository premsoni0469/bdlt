// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    address public admin;
    bool public votingOpen = true;

    uint public candidate1Votes;
    uint public candidate2Votes;

    mapping(address => bool) public hasVoted;

    constructor() {
        admin = msg.sender;
    }

    function vote(uint candidate) public {
        require(votingOpen, "Voting closed");
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;

        if(candidate == 1) {
            candidate1Votes++;
        }
        else if(candidate == 2) {
            candidate2Votes++;
        }
    }

    function endVoting() public {
        require(msg.sender == admin, "Only admin can end voting");
        votingOpen = false;
    }
}
