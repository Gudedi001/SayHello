// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyUpgradeContract is UUPSUpgradeable, OwnableUpgradeable {
    uint256 public value;
    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
        value = 100;
    }

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}