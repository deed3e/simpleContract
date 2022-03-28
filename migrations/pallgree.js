const pallgree = artifacts.require("pallgreeContract" );

module.exports = function (deployer) {
  deployer.deploy(pallgree);
};
