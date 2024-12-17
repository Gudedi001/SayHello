// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract FunctionModifier {
    address public owner;
    uint256 public x = 10;

    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"not owner");
        _;
    }

    modifier validAddress(address _addr){
        require(_addr != address(0),"not valid address");
        _;
    }

    modifier noReentrancy(){
        require(!locked,"no reentrancy");
        locked = true;
        _;
        locked = false;
    }
}