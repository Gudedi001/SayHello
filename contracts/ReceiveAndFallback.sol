// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract Callee {
    event FunctionCalled(string);

    function foo() external payable {
        emit FunctionCalled("This is fll");
    }

    receive() external payable {
        emit FunctionCalled("This is receive");
    }

    fallback() external payable {
        emit FunctionCalled("This is fallback");
    }

}


contract Caller {
    address payable callee;

    constructor() payable {
        callee = payable(address(new Callee()));
    }


    function transferReceive(uint256 amount) external {
        callee.transfer(amount);
    }

    function sendReceive(uint256 amount) external {
        bool success = callee.send(amount);
        require(success, "Failed to send Ether");
    }

    function callReceive() external {
        (bool success,bytes memory data) = callee.call{value: 100}("");
        require(success, "Failed to send Ether");
    }

    function callFoo() external {
        (bool success,bytes memory data) = callee.call{value:1}(abi.encodeWithSignature("foo()"));
        require(success, "Failed to send Ether");
    }

    //出发fallback函数，因为functionNotExist()不存在
    function callFallback() external {
        (bool success,bytes memory data) = callee.call{value:1}(abi.encodeWithSignature("functionNotExist()"));
        require(success, "Failed to send Ether");
    }



}