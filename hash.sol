// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashGenerator {
    function getHash() public pure returns(bytes32){
        return keccak256(abi.encodePacked("BLOCK"));
    }
}