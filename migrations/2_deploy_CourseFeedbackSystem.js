var CourseFeedbackSystem = artifacts.require("./CourseFeedbackSystem.sol");

module.exports = function(deployer) {
  deployer.deploy(CourseFeedbackSystem);
};