Uniswap is a cryptocurrency exchange based on Decentralized Network Protocol.

As of Nov 14 2022, there are 3 version of Uniswap they are

First version was launched in November 2018 and Uniswap v2 allowed only swaps between ether and a Token.

Chained Swaps were also possible allow token-token swaps.

Cross-chain swap is a decentralized mechanism for swapping or exchanging tokens of two different blockchains without an escrow or middleman.

Uniswap V2 was launched in March 2020. it comes with huge enhancement of V1 that allowed direct swaps between any ERC20 tokens, as well as chained swaps between any pairs.

Latest V3 was launched in May 2021 and included significantly improved captial effiency i.e capital efficiency is considered more effective when using digital assets than fiat because it is usually cheaper to maintain, utilize, process, and send than fiat money, particularly when considering the cost of scaling and security on a long-term and a global scale.

Uniswap V3 allows Liquidity providers to remove a bigger portion of their liquidity from pools and still keep getting the same rewards(or squeeze the captial in smaller price ranges and get up to 4000x of profits).

Lets move on to understand the Older version Uniswap v1.

Basically, Uniswap is based on an algorithm that allows to make pools, or token pairs, and fill them with liquidity to let users exchainge tokens using this liquidity. Such algorithm is called automated market maker or automated liquidity provider.

Let's look what is automated market maker

Market makers are entities that provider liquidity (trading assets) to markets. Liquidity is what makes trades possible: if you want to sell soemthing but no one is buying it, there won't be a trade. Some trading pairs have high liquidity(eg: BTC-USDT), but some have low or no liquidity at all (like scammy or shady altcoins).

https://www.youtube.com/watch?v=Af3NxB7r-Ws

Constant product market maker

Automated market maker is a general term that embraces different decentralized market maker algorithms. The most popular ones (and those that gave birth to the term) are related to prediction markets - markets that allow to make profit on predictions. Uniswap and other on-chain exchanges are a continuation of those algorithms.


### Correct Pricing Function

As we know that Uniswap is a constant product market amker, which means it's based on a constant product formula: X*Y = K

Does this formula produce a better pricing function ? Let's see

The formula states that K remains constant no matter what reserves X and Y are. Every trade increases a reserve of either ether or token and decreases a reserve of either token or ether - let's put that logic in a formula:

(x + delta x)(y - Delta y) = xy

where delta x is the amount of ethers or tokens we're trading for Delta y and amount of tokens or ethers we're getting in exchange. Having this formula we can find Delta Y from above equation

