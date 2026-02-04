# SecureVault – Solidity Smart Contract

SecureVault is a simple Ethereum smart contract written in Solidity that demonstrates secure ETH deposits, controlled withdrawals, and basic access management.

## What this project does
- Allows users to deposit ETH into the contract
- Enforces a daily withdrawal limit per user
- Supports approved withdrawers
- Emits events for deposits, withdrawals, and admin actions
- Includes pause functionality for safety

## Why I built this
I built this project to understand how real-world EVM smart contracts are structured, deployed, and tested. The focus was on security basics, clean Solidity patterns, and learning how on-chain logic works in practice.

## Tech stack
- Solidity (EVM)
- Remix IDE
- Ethereum Virtual Machine (local VM)
- Git & GitHub

## Key concepts covered
- `payable` functions
- mappings & access control
- events for transaction tracking
- basic security checks
- gas-aware design

## How to run
1. Open the contract in Remix
2. Compile using Solidity ^0.8.x
3. Deploy using Remix VM
4. Interact with deposit & withdraw functions

## Status
Learning project — actively improving and experimenting with testing, security patterns, and gas optimizations.
