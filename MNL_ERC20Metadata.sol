// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./MNL_ERC20.sol";

interface MNL_ERC20Metadata is MNL_ERC20Interface {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
}
