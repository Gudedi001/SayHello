const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules"); 
module.exports = buildModule("TodoListShowModule", (m) => { 
const todoListShow = m.contract("TodoListShow", []); 
return { todoListShow }; 
});