var SimpleStorage = artifacts.require("./SimpleStorage.sol");

var LandRecords = artifacts.require("./LandRecords.sol");

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(LandRecords);
};
