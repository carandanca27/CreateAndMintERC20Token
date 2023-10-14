// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./MNL_ERC20.sol";
import "./MNL_ERC20Metadata.sol";

contract MoonLit is MNL_ERC20Interface, MNL_ERC20Metadata {
    
    mapping(address => uint256) private _balances;
    uint256 private _totalSupply;
    string private _tokenName;
    string private _tokenSymbol;
    address private _tokenOwner;

    constructor() {
        _tokenName = "MOONLIT";
        _tokenSymbol = "MNL";
        _tokenOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _tokenOwner, "You are not the owner of MNL Tokens.");
        _;
    }

    function name() public view override returns (string memory) {
        return _tokenName;
    }

    function symbol() public view override returns (string memory) {
        return _tokenSymbol;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(_balances[msg.sender] >= amount, "ERC20[Insufficient Balance]: Transfer amount exceeds balance.");

        _balances[msg.sender] -= amount;
        _balances[to] += amount;

        emit TransferMNL(msg.sender, to, amount);
        return true;
    }

    function mint(address to, uint256 amount) public override onlyOwner {
        _totalSupply += amount;
        _balances[to] += amount;

        emit MintMNL(to, amount);
        emit TransferMNL(address(0), to, amount);
    }

    function burn(uint256 amount) public override {
        require(_balances[msg.sender] >= amount, "ERC20[Insufficient Balance]: Burn amount exceeds balance.");

        _balances[msg.sender] -= amount;
        _totalSupply -= amount;

        emit BurnMNL(msg.sender, amount);
        emit TransferMNL(msg.sender, address(0), amount);
    }
}