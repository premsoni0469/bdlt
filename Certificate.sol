// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Certificate {

    struct Cert {
        string name;
        bool valid;
    }

    mapping(uint => Cert) public certificates;

    // Issue Certificate
    function issue(uint id, string memory name) public {
        certificates[id] = Cert(name, true);
    }

    // Verify Certificate
    function verify(uint id) public view returns(string memory, bool) {
        return (certificates[id].name, certificates[id].valid);
    }
}