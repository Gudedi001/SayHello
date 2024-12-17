// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract Loop {
    function loop() public pure {
        // for loop
        for (uint256 i = 1; i < 10; i++){
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint256 j = 0;
        while (j < 10) {
            j++;
        }
    }
}