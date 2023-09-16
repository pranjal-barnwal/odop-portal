var SellerRegistry = artifacts.require("SellerRegistry");

module.exports = function (deployer) {
  deployer.deploy(SellerRegistry);
};
