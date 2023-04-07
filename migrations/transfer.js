const transfer = artifacts.require("Transfer");

module.exports = function (deployer) {
  deployer.deploy(transfer);
};
