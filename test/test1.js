const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("ERC721FactoryClone", function () {
  it("Should return the freaking NFT etc.", async function () {
    const MyNFT = await ethers.getContractFactory("ERC721FactoryClone");
    const mynft = await MyNFT.deploy();
    await mynft.deployed();

    const receipt = await mynft.createToken("Artist 1", "NF1", "https://example.com") 
    await receipt.wait();

    //const address = receipt.logs.find(({ event }) => event === 'NewInstance').args.instance;

    console.log(receipt);

  });
});

