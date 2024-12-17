require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.27",
    settings: {
      evmVersion: "cancun",
    }
  },
  networks: { 
    hardhat: {}, 
    sepolia: { 
      url:
       "https://sepolia.infura.io/v3/" + process.env.INFURA_ID, accounts: [`0x${process.env.PRIVATE_KEY}`], 
       }, 
    }, 
};
