# RewardsManager Smart Contract

## Description

RewardsManager is a Solidity smart contract designed to manage a reward points system. It allows the contract owner to check eligibility for different reward tiers and update reward points accordingly.

## Features

- Maintains a reward points balance
- Implements different reward tiers: Premium, Standard, and Basic
- Restricts certain functions to the contract owner only
- Emits events when reward points are updated
- Includes safety checks and error handling

## Contract Details

- License: MIT
- Solidity Version: ^0.8.0

## Main Functions

1. `checkForPremiumReward(uint256 newRewardPoints)`
   - Checks if the user is eligible for a premium reward (> 90 points)
   - Only callable by the contract owner

2. `checkForStandardReward(uint256 newRewardPoints)`
   - Checks if the user is eligible for a standard reward (> 70 points)
   - Only callable by the contract owner

3. `checkForBasicReward(uint256 newRewardPoints)`
   - Checks if the user is eligible for a basic reward (> 50 points)
   - Only callable by the contract owner

4. `checkMinimumRewardPoints()`
   - Asserts that the current reward points are at least 30
   - View function, can be called by anyone

5. `checkForAnyReward(uint256 newRewardPoints)`
   - Checks if the user has enough points for any reward (> 40 points)
   - Reverts if points are insufficient
   - Only callable by the contract owner

## Events

- `RewardPointsUpdated(uint256 newRewardPoints)`: Emitted when reward points are updated

## Modifiers

- `onlyContractOwner()`: Restricts function access to the contract owner

## Usage

1. Deploy the contract. The deploying address becomes the contract owner.
2. Use the appropriate functions to check eligibility and update reward points.
3. Monitor the `RewardPointsUpdated` event for changes in reward points.

## Security Considerations

- Only the contract owner can update reward points
- The contract includes require statements to validate inputs and conditions
- An assert statement is used to ensure a minimum reward point balance
