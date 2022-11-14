//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// since every exchange allows swaps with only onetoken, we need to connect
// Exchange with a token address:
contract Exchange{
    address public tokenAddress;
    constructor(address _token){
        require(_token != address(0), "invalid token address");
        tokenAddress  = _token;
    }

    function addLiquidity(uint256 _tokenAmount) public payable{
        IERC20 token = IERC20(tokenAddress);
        token.transferFrom(msg.sender, address(this), _tokenAmount);
    }

    // adding a helper function that returns token balance of an exchange:
    function getReserve() public view returns (uint256){
        return IERC20(tokenAddress).balanceOf(addres(this));
    }

}