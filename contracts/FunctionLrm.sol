// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Function {
    function returnMany() public pure returns (uint256,bool,uint256){
        return (1,true,2);
    }

    function named() public pure returns (uint256 x,bool,uint256 y){
        return (1,true,2);
    }

    function assigned() public pure returns(uint256 x,bool b,uint256 y){
        x=1;
        b=true;
        y=2;
    }

    function destructuringAssignments() public pure returns (uint256,bool,uint256,uint256,uint256){
        (uint256 i,bool b,uint256 j) = returnMany();
        (uint256 x,,uint256 y) = (2,4,3);
        return (i,b,j,x,y);
    }

    
}