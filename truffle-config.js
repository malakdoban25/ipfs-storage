require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    development: {
      provider: function() {
        return new HDWalletProvider(
          "chef intact assist wide repeat thrive script crystal black grow people cactus",
          "http://127.0.0.1:7545"
        );
      },
      network_id: 5777
    }
  },

  compilers: {
    solc: {
      version: "0.8.19"
    }
  }
};