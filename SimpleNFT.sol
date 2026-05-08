// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleNFT {
    struct NFT {
        string name; string metadata; address owner;
    }

    NFT[] public nfts;

    function mintNFT (string memory _name,string memory _metadata) public {
        nfts.push(NFT( _name, _metadata, msg.sender));
    }

    function transferNFT(uint index, address newOwner) public {
        require(nfts[index].owner == msg.sender, "Not owner");
        nfts[index].owner = newOwner;
    }

    function getNFT(uint index) public view returns(string memory, string memory, address){
        NFT memory n = nfts[index];
        return ( n.name, n.metadata, n.owner);
    }
}