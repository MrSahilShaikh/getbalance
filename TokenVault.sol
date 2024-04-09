// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract TokenVault is AccessControl {
    using Address for address payable;

    address public withdrawer;

    bytes32 public constant WITHDRAWER_ROLE = keccak256("WITHDRAWER_ROLE");

    event FundsDeposited(address indexed sender, uint256 amount);
    event FundsWithdrawn(address indexed withdrawer, uint256 amount);
    event addedWithdrawer(address indexed withdraw);

    

    constructor(address defaultAdmin) {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
    }

    function setWithdrawer(address _withdrawer) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(_withdrawer != address(0), "Invalid withdrawer address");
        withdrawer = _withdrawer;
        grantRole(WITHDRAWER_ROLE, _withdrawer);
        emit addedWithdrawer(_withdrawer);

    }

    function deposit() external payable {
        require(msg.value > 0, "No funds sent");
        emit FundsDeposited(msg.sender, msg.value);
    }

    function withdraw() external {
        require(msg.sender == withdrawer, "Only withdrawer can withdraw");
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds available for withdrawal");
        payable(msg.sender).sendValue(balance);
        emit FundsWithdrawn(msg.sender, balance);
    }
}
