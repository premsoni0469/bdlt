// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {

    address public buyer;
    address public seller;

    bool public buyerApproved;
    bool public sellerApproved;

    constructor(address _seller) payable {
        buyer = msg.sender;
        seller = _seller;
    }

    function approve() public {

        if(msg.sender == buyer)
            buyerApproved = true;

        if(msg.sender == seller)
            sellerApproved = true;

        if(buyerApproved && sellerApproved) {
            payable(seller).transfer(
                address(this).balance
            );
        }
    }
     // Send money to seller
    function releasePayment() public {
        payable(seller).transfer(
                address(this).balance
            );
    }

}
