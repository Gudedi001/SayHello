// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

library SafeMath{
    function add(uint a,uint b) internal pure returns(uint){
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
}

contract AddTest {
    function add(uint x,uint y)public pure returns(uint){
        return SafeMath.add(x,y);
    }
}

contract TestLib{
    using SafeMath for uint;

    function add(uint x,uint y) public pure returns(uint){
        return x.add(y);
    }
}

// library Search {
//     function indexOf(uint[] storage self,uint value) public view returns(int){
//         for(int i =0; i < self.length;i++){
//             if(self[i] == value) return i;
//         }
//         return -1;
//     }
// }

// contract C {
//     using Search for uint[];
//     uint[] data;
//     function append(uint value) public {
//         data.push(value);
//     }

//     function replace(uint _old,uint _new) public {
//         uint index = data.indexOf(_old);
//         if(index == -1){
//             data.push(_new);
//         }else{
//             data[index] = _new;
//         }
//     }
// }

contract GasMag{
    uint num =0;
    function expensiveLoop(uint x) public {
        for(uint i=0;i<x;i++){
            num += 1;
        }
    }

    function lessExpensiveLoop(uint x) public {
        uint temp = num;
        for(uint i = 0;i<x;i++){
            temp += 1;
        }
        num = temp;
    }

}

contract Assembler{
    // function do_something_cpu() public {
    //     assembly{

    //     }
    // }

    function addAssembly(uint x,uint y) public pure returns (uint){
        assembly{
            let result := add(x,y)
            mstore(0x0,result)
            return(0x0,32)
        }
    }
}