// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @dev Interface of the ERC20.
 */

interface MNL_ERC20Interface {
    function totalSupply() external view returns (uint);
    function transfer(address to, uint amount) external returns (bool success);
    function mint(address to, uint256 amount) external;
    function burn(uint256 amount) external;

    /**
     * @dev Events to log transactions.
     */
    event MintMNL(address indexed account, uint256 value);
    event BurnMNL(address indexed account, uint256 value);
    event TransferMNL(address indexed from, address indexed to, uint256 amount);
}
