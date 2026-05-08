// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {

    struct Product {
        string name; string status; address participant; uint time;
    }

    Product[] public products;

    function addProduct(string memory _name, string memory _status) public {
            products.push(Product(_name, _status, msg.sender, block.timestamp));
    }

    function getProduct(uint index) public view returns(string memory, string memory, address, uint){
        Product memory p = products[index];
        return (p.name, p.status, p.participant, p.time);
    }
}