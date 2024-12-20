// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Owned {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function setOwner(address _owner) public virtual{
        owner = payable(_owner);
    }
}

contract Mortal is Owned {
    event SetOwner(address indexed owner);

    function kill() public {
        if(msg.sender == owner) selfdestruct(owner);
    }

    function setOwner(address owner) public override {
        super.setOwner(owner);
        emit SetOwner(owner);
    }
}

abstract contract A {
    function get() virtual public;
}

contract Base {
    function foo() virtual public {}
}

// contract Middel isBase {}

// contract Inherited is Middel {
//     function foo() public override {}
// }

// contract Base1{
//     function foo() virtual public {}
// }

// contract Base2{
//     function foo() virtual public {}
// }

// contract Inherited1 is Base1, Base2 {
//     function foo() public override(Base1,Base2){}
// }

// interface IToken {
//     function transfer(address recipient,uint256 amount) external;
// }

// contract SimpleToken is IToken {
//     mapping(address => uint256) balances;

//     constructor(){
//         balances[msg.sender]=10000;
//     }

//     function transfer(address recipient, uint256 amount) public override{
//         require(balances[msg.sender] >= amount, "Not enough funds");
//         balances[msg.sender] -= amount;
//         balances[recipient] += amount;
//     }
// }

// contract Awards {
//     IToken immutable token;

//     constructor(IToken _token){
//         token = _token;
//     }

//     function sendBonus(address user) public {
//         token.transfer(user,19);
//     }
// }