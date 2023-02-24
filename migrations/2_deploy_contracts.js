var caller = artifacts.require("caller");
var calledContract = artifacts.require("calledContract");
var calledLibrary = artifacts.require("calledLibrary");

module.exports = function(deployer) {

  // deployer.deploy(calledContract);
  // deployer.deploy(calledLibrary);

  // deployer.link(calledLibrary, [caller]);

  deployer.deploy(caller);
};

// 惊人发现，如果注释掉3行，不影响