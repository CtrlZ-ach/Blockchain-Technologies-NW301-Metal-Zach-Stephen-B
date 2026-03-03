// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";

contract SimpleGoldVault is ERC4626 {

    constructor(IERC20 _asset)
        ERC20("Vault Gold", "vGOLD")
        ERC4626(_asset)
    {}
}

contract MockGold is ERC20 {

    constructor() ERC20("Mock Gold", "GOLD") {
        _mint(msg.sender, 1_000_000 ether);
    }
}