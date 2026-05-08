// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {

    address payable public seller;

    constructor(address payable _seller) payable {
        seller = _seller;
    }

    // Send money to seller
    function releasePayment() public {
        seller.transfer(address(this).balance);
    }
}