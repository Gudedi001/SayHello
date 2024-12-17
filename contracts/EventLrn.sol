// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract EventLrn{
    event Log(address indexed sender,string message);
    event AnotherLog();


    function test() public {
        emit Log(msg.sender,"Hello World");
        emit Log(msg.sender,"Hello Evm");
        emit AnotherLog();
    }
}