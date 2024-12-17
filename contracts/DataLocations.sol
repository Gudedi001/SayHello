// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/**
 * Variables are declared as either storage,memory or calldata to explicitly specify the location of the data.
 * 
 */

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStruct;

    function f() public {
       _f(arr, map, myStruct[1]);
    }

    function _f(
        uint256[]  storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _mystruct
    ) internal {
        // do something with storage variables
    }

    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
    }

    function h(uint256[] calldata _arr) public {
        // do something with calldata array+

    }

}

interface ITest {
    function val() external view returns (uint256);
    function test() external;
}

contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }

}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 134;
        bytes memory b = "0x602a3d";
        msg.sender.call(b);
    }

}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        assembly {
            tstore(SLOT,321)
        }
        bytes memory b = "0x602a3d";
        msg.sender.call(b);
    }

    function val() public view returns (uint256) {
        assembly {
            v := tload(SLOT)
        }
    }

}