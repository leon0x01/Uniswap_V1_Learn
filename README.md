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

Market makers are entities that provider liquidity (trading assets) to markets. Liquidity is what makes trades possible: if you want to sell something but no one is buying it, there won't be a trade. Some trading pairs have high liquidity(eg: BTC-USDT), but some have low or no liquidity at all (like scammy or shady altcoins).

Automated market maker is a type of DEX protocol that relies on a mathematical formula to price assets. Instead of using an order book like a traditional exchange, assets are priced according to a pricing algorithm.

This formula can vary with each protocol. For example, Uniswap uses x*y = k, where x is the ammount on on token in the liquidity pool, and y is the amount of the other. In this formula, k is a fixed constant, meaning the pool's total liquidity always has to remain the same. Other AMMs will use other formulas for the specific use cases they target. 

In Traditional market making usually works with firms with vast resources and complex strategies. Market makers help you get a good price and tight bid-ask spread on an order book exchange like Binance. AMM decentralized this process and let essentially anyone create a market on a blockchain. How exactly can they do that? Let's read on.

https://www.youtube.com/watch?v=Af3NxB7r-Ws
https://www.youtube.com/watch?v=Ui1TBPdnEJU

Constant product market maker

Automated market maker is a general term that embraces different decentralized market maker algorithms. The most popular ones (and those that gave birth to the term) are related to prediction markets - markets that allow to make profit on predictions. Uniswap and other on-chain exchanges are a continuation of those algorithms.


### Correct Pricing Function

As we know that Uniswap is a constant product market maker, which means it's based on a constant product formula: X*Y = K

Does this formula produce a better pricing function ? Let's see

The formula states that K remains constant no matter what reserves X and Y are. Every trade increases a reserve of either ether or token and decreases a reserve of either token or ether - let's put that logic in a formula:

(x + delta x)(y - Delta y) = xy

where delta x is the amount of ethers or tokens we're trading for Delta y and amount of tokens or ethers we're getting in exchange. Having this formula we can find Delta Y from above equation

## LP-Tokens

LP-tokens is a crucial part of the Uniswap design. There need to have a way to reward liquidity providers for their tokens. If they're not incentivized, they won't provide liquidity because no one would put their tokens in a third-party contract for nothing.

The only good way to incentivized the liquidity providers is to collect a small fee on each token swap and distribute accumulated fees among the liquidity providers. This also seems pretty much fair: users (traders) pay for services (liquidity) providerd by other people.

For rewards to be fair, we need to reward liquidity providers proportionally to their contribution, i.e. the amount of liquidity they provide. IF someone has 50% of pool liquidity, they should get 50% of accumulated fees.

Now, the task seems pretty complicated. However, there's an elegant solution: LP-tokens.

LP-tokens are basically ERC20 tokens issued to liquidity providers in exchange for their liquidity. In fact, LP-tokens are shares:
1. You get LP-tokens in exchange for your liquidity.
2. The amount of tokens you get is proportional to the share of your liquidity in pool's reserves.
3. Fees are distributed proportionally to the amount of tokens you hold.
4. LP-tokens can be exchanged back for liquidity + accumulated fees.

 how will we calculate the amount of issued LP-tokens depending on the amount of provided liquidity? This is not so obvious because there a some requirements we need to meet:


1. Every issued share must be always correct. When someone deposits or removes liquidity after me, my share must remain correct.
2. Write operations(eg. storing new data or updating existing data in a contract) on Ethereum are very expensive. So we'd want to reduce maintenance costs of LP-tokens (i.e. we don't want to run a scheduled job that regularly recalculates and updates shares).

Imagine if we issues alot of tokens, suppose 1 billion and distribute them to all of the liquidity providers in pool. Suppose if we distribute all the tokens at first liquidity provider gets 1 Billion token, and second one gets a share of it, etc). we are forced to recalculate issued shares, which is expensive. If we distribute only a portion of the tokens initially, then we're risking hitting the supply limit,

The only good solution seems to not have supply limit at all and mint new tokens when new liquidity is added. This allows infinte growth and, if we use a proper formula, all issued shares will remain correct ( will scale proportionally) wehn liqudity is added or removed. Luckily, inflation doesn't reduce value of LP-tokens because they're always backed by some amount of liquidity tht doesn't depend on the number of issued tokens.

Now, So how to calculated the amount of minted LP-tokens when liquidity is deposited?

The Exchange contract stores reserves of ether and token. so how do we calculated the amount of minted LP-tokens from reserves of both ether and token? or only one of them? OR Both? 

Uniswap V1 calculated the amount proportionally to the ether reserve, but Uniswap V2 allows only swpas between tokens (not between ether and token), so it's not clear how to choose between them. Let's stick to what Uniswap V1 does and later we'll see how to solve this problem when there are two ERC20 tokens.


The following equation shows how the amount of new LP-tokens is calculated depending on the amount of ethers deposited:

To calculate the amount of new LP tokens that will be created, you will need to know the following information:

    The amount of cryptocurrency that is being contributed to the liquidity pool: This is known as the "deposit amount."

    The current market value of the cryptocurrency being deposited: This is known as the "deposit value."

    The total amount of liquidity currently in the pool: This is known as the "pool size."

With this information, you can use the following formula to calculate the number of new LP tokens that will be created:

    New LP tokens = (Deposit Amount / Deposit Value) * Pool Size

    amountMinted =  (EthDeposited / EthReserve) * totalAmount

For example, if you deposit 1,000 units of cryptocurrency with a market value of $10 per unit, and the total pool size is currently 100,000 units, the number of new LP tokens you will receive will be:

    New LP tokens = (1,000 / 10) * 100,000 = 10,000


## Fees

How to collect fees on swaps. Before that we need to answer a couple of questions:

1. Do we want to take fees in ether or tokens? Do we want to pay rewards to liqudity providers in ether or tokens?
2. How to collect a small fixed fee from each swap?
3. How to distribute accumulated fees to liquidity providers proportionally to their contributio?

This might looks a bit tedious task to do but we already have everything to solve it.

Let's think about the last two questions. We might introduce an extra payment that's sent along with a swap transaction. Such payments then get accumulated in a fund from which any liquidity provider can withdraw an amount proportional to their share. 

1. Traders already send ethers/tokens to the exchange contract. Instead of asking for a fee we can simply subtract it from ethers/tokens that are sent to the contract.

2. We already have the fund - it's the exchange reserves! The reserves can be used to accumulated fees. This also means that reserves will grow over time, so the constant product formulat is not that constant! However, this doesn't invalidate it: the fee is small compared to reserves and there's not way to manipulate it to try to significanlty chagne reserves.

3. And now we have an answer to the first question: Fees are paid in the currency of the traded in asset. Liquidity providers get a balanced amount of ethers and tokens plus a share of accumulated fees proportional to the share of their LP-tokens.

That's it! Let's get to the code. 


Uniswap takes 0.3% in fees from each swap. We'll take 1% just so that it's easier to see the difference in tests. Adding fees to the contract is as easy as adding a couple of multipliers to getAmount function


amountwithFee = amount * (100-fee) /100

## Removing liquidity 

So if liquidity provider want to remove their liqudity what to do?

To remove liqudity we can again use LP-tokens: we don't need to remember amounts deposited by each liquidity provider and can calculate the amount of removed liquidity based on an LP-tokens share.

When liquidity is removed, it's returned in both ethers and tokens and their amounts are, of coursed, balanced. This is the moment that causes impermanent loss: the ration of reserves changes over time following changes in their prices in USD. When liquidity is removed the balance can be different from what it was when liquidity was deposited. This means that you would get different amounts of ethers and tokens and their total price might be lower than if you have just held them in wallet.

As of Now we have implemented all core mechanics of Exchange contract, including pricing function, swapping, LP-tokens, and fees. We're about to implement factory contract.

### What Factory is for?

Basically, Factory contract serves as a registry of exchanges: every new deployed Exchange contract is registered with a Factory. And this is an important mechanic any exchange can be foun d by querying the registry. 

- Factory contract can also deploy and exchange without dealing with code, nodes, deploying scripts, and any other development tools. 

- Factory implements a function that allows users to creat and deploy an exchange by simply calling this function. So, toady we'll also learn How a contract can deploy another contract.

