// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RewardsManager 
{
    uint256 public rewardPoints = 0;
    address public contractOwner;

    // Event to notify when reward points are updated
    event RewardPointsUpdated(uint256 newRewardPoints);

    // Modifier to restrict access to the contract owner
    modifier onlyContractOwner() 
    {
        require(msg.sender == contractOwner, "Caller is not the contract owner");
        _;
    }

    constructor() 
    {
        // Set the contract deployer as the contract owner
        contractOwner = msg.sender;
    }

    // Function to check eligibility for premium reward
    function checkForPremiumReward(uint256 newRewardPoints) external onlyContractOwner 
    {
        require(newRewardPoints > 90, "You are not eligible for the reward.");

        rewardPoints = newRewardPoints;
        emit RewardPointsUpdated(newRewardPoints);
    }

    // Function to check eligibility for standard reward
    function checkForStandardReward(uint256 newRewardPoints) external onlyContractOwner 
    {
        require(newRewardPoints > 70, "You are not eligible for the reward.");

        rewardPoints = newRewardPoints;
        emit RewardPointsUpdated(newRewardPoints);
    }

    // Function to check eligibility for basic reward
    function checkForBasicReward(uint256 newRewardPoints) external onlyContractOwner
    {
        require(newRewardPoints > 50, "You are not eligible for the reward.");

        rewardPoints = newRewardPoints;
        emit RewardPointsUpdated(newRewardPoints);
    }

    // Function to check the minimum reward points required for any reward
    function checkMinimumRewardPoints() external view 
    {
        assert(rewardPoints >= 30); // This should always be true
    }

    // Function to revert if reward points are not sufficient for any reward
    function checkForAnyReward(uint256 newRewardPoints) external onlyContractOwner {
        if (newRewardPoints <= 40) {
            revert("You don't have enough points for any reward.");
        }
        rewardPoints = newRewardPoints;
        emit RewardPointsUpdated(newRewardPoints);
    }
}
