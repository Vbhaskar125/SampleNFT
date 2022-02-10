const metaNFT = artifacts.require("./MetaschoolNFT.sol");

module.exports = function (deployer) {
  deployer.deploy(metaNFT, "TestNFT", "TFT");
};
