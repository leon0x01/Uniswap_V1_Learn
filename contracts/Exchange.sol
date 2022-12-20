//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// since every exchange allows swaps with only onetoken, we need to connect
// Exchange with a token address:
contract Exchange is ERC20{
    address public tokenAddress;
    constructor(address _token) ERC20("ChamroSwap-v1", "Chamro-v1"){
        require(_token != address(0), "invalid token address");
        tokenAddress  = _token;
    }

    function addLiquidity(uint256 _tokenAmount) public payable{
        //IERC20 token = IERC20(tokenAddress);
        //token.transferFrom(msg.sender, address(this), _tokenAmount);
        if (getReserve() == 0 ) {
            IERC20 token = IERC20(tokenAddress);
            token.transferFrom(msg.sender, address(this), _tokenAmount);
        }
        else {
            uint256 ethReserve = address(this).balance - msg.value;
            uint256 tokenReserve = getReserve();
            uint256 tokenAmount = (msg.value * tokenReserve) / EthReserve;

            require(_tokenAmount >= tokenAmount, "insufficient token Amount");

            IERC20 token = IERC20(tokenAddress);
            token.transferFrom(msg.sender, address(this), tokenAmount); 
        }
    }

    // adding a helper function that returns token balance of an exchange:
    function getReserve() public view returns (uint256){
        return IERC20(tokenAddress).balanceOf(address(this));
    }
    
    function getPrice(uint256 inputReserve, uint256 outputReserve)
        public
        pure
        returns (uint256)
    {
        require(inputReserve > 0 && outputReserve > 0, "invalid reserves");
        return (inputReserve * 1000) / outputReserve;
    }
    
    function getAmount(
        uint256 inputAmount,
        uint256 inputReserve,
        uint256 outputReserve
    ) private pure returns (uint256){
        require(inputReserve > 0 && outputReserve > 0, "invalid reserves");
        return (inputAmount * outputReserve) / (inputReserve + inputAmount);
    }

    function getTokenAmount(
        uint256 _ethSold) public view returns (uint256) {
            require(_ethSold > 0, "ethSold is too small");
            uint256 tokenReserve = getReserve();
            return getAmount(_ethSold, address(this).balance, tokenReserve);
        }
    function getEthAmount(
        uint256 _tokenSold) public view returns 
        (uint256){
            require(_tokenSold > 0, "tokenSold is too small");
            uint256 tokenReserve = getReserve();
            return getAmount(_tokensold, tokenReserve, address(this).balance);
        }
    function ethToTokenSwap(int256 _minTokens) public payable {
        uint256 tokenReserve = getReserve();
        uint256 tokensBought = getAmount(
            msg.value,
            address(this).balance - msg.value,
            tokenReserve
        );
        require(tokensBought >= _minTokens, "insufficent output amount");
        IERC20(tokenAddress).transfer(msg.sender, tokensBought);
    }

    function tokenToEthSwap(uint256 _tokensSold, uint256 _minEth) public {
        uint256 tokenReserve = getReserve();
        uint256 ethBought = getAmount(_tokenSold, tokenReserve, address(this).balance);
    };
    require(ethBought >= _minEth, "insufficient output amount");
    IERC20(tokenAddress).transferFrom(msg.sender, address(this), _tokenSold);
    payable(msg.sender).transfer(ethBought);
}