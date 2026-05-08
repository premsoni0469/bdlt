// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Todo {
    struct Task {
        string text;
        bool completed;
    }

    mapping(address => Task[]) public tasks;

    function addTask(string memory _text) public {
        tasks[msg.sender].push(Task(_text, false));
    }

    function completeTask(uint index) public {
        tasks[msg.sender][index].completed = true;
    }

    function getTask(uint index) public view returns(string memory, bool){
        Task memory t = tasks[msg.sender][index];
        return (t.text, t.completed);
    }
}