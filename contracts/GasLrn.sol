// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;

contract GasLrn {
    uint256 public i = 0;
    //Using up all of the gas that you send causes your transaction to fail.
    //State changes are undone.
    //But the gas fees paid are not undone.
    //Gas spent are not refunded.

    function forever() public {
        // Here we run a loop until all of the gas are spent
        // and the transaction fails
        while (true) {
            i += 1;
        }
    }
}