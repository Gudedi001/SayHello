// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/interfaces/IERC777Recipient.sol";
import "@openzeppelin/contracts/interfaces/IERC777Sender.sol";
import "@openzeppelin/contracts/utils/introspection/ERC1820Implementer.sol";


contract MyErc777Token is ERC777,AccessControl,IERC777Recipient,IERC777Sender,ERC1820Implementer {
    //定义管理员角色常量
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    //ERC1820注册接口标识符
    bytes32 private constant TOKENS_SENDER_INTERFACE_HASH = keccak256("ERC777TokensSender");
    bytes32 private constant TOKENS_RECIPIENT_INTERFACE_HASH = keccak256("ERC777TokensRecipient");

    constructor (uint256 initialSupply,
                 address[] memory defaultOperators
    ) ERC777("MyERC777Token", "M777",defaultOperators){
        //将初始供应量的代币分配给部署者
        _mint(msg.sender, initialSupply, "", "");
        //将部署者设置为管理员
        _setupRole(ADMIN_ROLE, msg.sender);

        //注册ERC777的Hooks接口
        ERC1820Implementer._registerInterfaceForAddress(TOKENS_RECIPIENT_INTERFACE_HASH, address(this));
        ERC1820Implementer._registerInterfaceForAddress(TOKENS_SENDER_INTERFACE_HASH, address(this));
    }

    //Hooks:tokensToSend and tokensReceived

    /**
     * 在发送代币之前被调用
     */
    function tokensToSend(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    )external override{
        require(to != address(0), "ERC777: transfer to the zero address");
        emit TokensToSend(operator, from, to, amount, userData, operatorData);
    }

    /**
     * 在收到代币后被调用
     */
    function tokensReceived(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external override{
        //省略。。。比如黑名单判断
        emit TokensReceived(operator, from, to, amount, userData, operatorData);
    }
    /**
     * 管理员销毁指定地址的代币
     */
    // function burmFrom(uint256 amount,bytes calldata userData) external onlyRole(ADMIN_ROLE){
    //     require(account != address(0), "ERC777: burn from the zero address");
    //     _burn(ADMIN_ROLE,account);
    // }

    /**
     * 授予其他地址管理员权限
     */
    function grantAdmingRole(address account) external onlyRole(ADMIN_ROLE){
        grantRole(ADMIN_ROLE, account);        
    }


    /**
     * 事件定义
     */
    event TokensToSend(address operator, address from, address to, uint256 amount, bytes userData, bytes operatorData);
    event TokensReceived(address operator, address from, address to, uint256 amount, bytes userData, bytes operatorData);
}