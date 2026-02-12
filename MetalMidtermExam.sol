// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//import: OpenZeppelin ERC2-
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MetalSecCon is ERC20 {
    bytes32 public secretHash;
    address public owner;
    constructor(bytes32 _secretHash) ERC20("BLOCK", "CON") {
        owner = msg.sender;
        secretHash = _secretHash;
    }

    function claimTokens(string memory _password, uint256 _amount) public {
        bytes32 inputHash = keccak256(abi.encodePacked(_password));

        require(inputHash == secretHash, "Incorrect password. Mint denied.");
        //if correct
        _mint(msg.sender, _amount);
    }

}