// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) ERC20(name, symbol){
        _mint(msg.sender, initialSupply);
    }
}

/* In above Token contract we're creating token ERC20 contract provided by
openZepplin and defining our own constructor that allows to take name of
the token , symbole and initial supply. the constructor also mints intialSupply 
of tokens and sends them to token creator's address. */