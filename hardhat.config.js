require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-waffle");

const fs = require('fs')
const privateKey = fs.readFileSync('.env', 'utf8')

module.exports = {
    networks: {
      goerli: {
        chainId: 5,
        url: 'https://goerli.infura.com/----',
        accounts: [privateKey]
      }
      mainnet: {
        chainId: 1,
        url: 'https://mainnet.infura.com/----',
        accounts: [privateKey]
      }
    },
    solidity: {
      compilers: [
        { 
          version: "0.8.17",
          settings: {
            optimizer: {
              enabled: true,
              runs: 200,
            },
          }
        }
      ]
    }
}
