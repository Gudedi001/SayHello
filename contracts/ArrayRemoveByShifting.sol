// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract ArrayRemoveByShifting {
    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound");

        for(uint256 i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function removeReplace(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }
}