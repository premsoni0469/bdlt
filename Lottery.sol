// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {

    address[] public players;
    // Buy ticket
    function enter() public payable {
        require(msg.value == 1 ether);
        players.push(msg.sender);
    }

    // Pick winner
    function pickWinner() public {
        uint index = uint(
            keccak256(
                abi.encodePacked(block.timestamp, players.length)
            )
        ) % players.length;

        payable(players[index]).transfer(address(this).balance);

        players = new address[](0);
    }
}