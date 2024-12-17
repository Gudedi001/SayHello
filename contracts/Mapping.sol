// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Mapping {
    //Mapping from address to uint
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        //Mapping always returns a value
        // If the value was never set ,it will return the default value.
        //0 for uint
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        //Update the value at this address
        myMap[_addr] = _i;
    }

     function remove(address _addr) public {
        //reset the value to the default value.
        delete myMap[_addr];
     }

     

}