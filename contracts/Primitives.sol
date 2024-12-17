// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.2;

contract Primitives{
    bool public boo = true;

    /*
    uint stands for unsigned integer,meaning non negative integers
    different sizes are available
        uint8 ranges from 0 to 2**8 - 1
        uint16 ranges from 0 to 2**16 - 1
        ...
        uint256 ranges from 0 to 2**256 - 1
    */
   uint8 public u8 = 1;
   uint256 public u256 = 456;
   uint256 public u = 123;//uint is an alias for uint256

   int256 public minInt = type(int256).min;
   int256 public maxInt = type(int256).max;

   address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

}