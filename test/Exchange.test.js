require("@nomiclabs/hardhat-waffle");

const { expect } = require("chai");
const toWei = (value) => ethers.utils.parseEther(value.toString());

const fromWei = (value) => 
    ethers.utils.formatEther(
        typeof value ==="string" ? value : value.toString()
    );

const getBalance = ethers.provider.getBalance;

describe("Exchange", ()=> {
    let owner;
    let user;
    let exchange;

    beforeEach(async () => {
        [owner, user] = await ethers.getSigners();

        const Token = await ethers.getContractFactory("Token");
        token = await Token.deploy("Token", "TKN", toWei(1000000));
        await token.deployed();

        const Exchange = await ethers.getContractFactory("Exchange");
        exchange = await Exchange.deploy(token.address);
        await exchange.deployed();
    })
});

it("is deployed", async () => {
    expect(await exchange.deployed())
});