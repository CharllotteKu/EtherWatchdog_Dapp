require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {          // 网络配置情况，下面可以添加多个网络的配置 
    localhost: {       // 本地网络 
      url: "http://127.0.0.1:8545"    // 本地网络的 url 
    }
  }
};
