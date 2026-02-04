// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecureVault {
    address public owner;
    bool public paused;

    mapping(address => bool) public approvedWithdrawers;
    mapping(address => uint256) public withdrawnAmount;

    uint256 public constant DAILY_LIMIT = 1 ether;

    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);
    event WithdrawerUpdated(address indexed user, bool approved);
    event Paused(bool status);

    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Vault is paused");
        _;
    }

    receive() external payable {
        emit Deposited(msg.sender, msg.value);
    }

    function approveWithdrawer(address user, bool approved) public onlyOwner {
        approvedWithdrawers[user] = approved;
        emit WithdrawerUpdated(user, approved);
    }

    function withdraw(uint256 amount) public whenNotPaused {
        require(
            msg.sender == owner || approvedWithdrawers[msg.sender],
            "Not authorized"
        );

        require(address(this).balance >= amount, "Insufficient balance");

        withdrawnAmount[msg.sender] += amount;
        require(
            withdrawnAmount[msg.sender] <= DAILY_LIMIT,
            "Daily limit exceeded"
        );

        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }

    function pauseVault(bool _paused) public onlyOwner {
        paused = _paused;
        emit Paused(_paused);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
