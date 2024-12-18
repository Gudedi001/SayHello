// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/Ownable.sol";
import ""

contract OwnableTest is Ownable(msg.sender) {


    function test() public onlyOwner {

    }
}