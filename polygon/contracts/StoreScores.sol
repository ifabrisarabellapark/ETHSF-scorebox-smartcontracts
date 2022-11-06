pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;
// SPDX-License-Identifier: GPL-3.0

import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";


//contract
contract StoreScores is Ownable {
    struct User {
        int16 score;
        string description;
    }

    //define members for your smart contract
    mapping(address => User[]) public records;
    uint256 public userCount;
    uint256 public scoreCount;

    error NoScoreHistory(address wallet);

    constructor() Ownable() {
        userCount = 0;
        scoreCount = 0;
    }

    function uploadScore(
        int16 _score,
        string calldata _description
    ) public payable returns (bool b) {
        b = false;

        if (records[msg.sender].length != 0) {
            //if it's a returning user, append new score to existing mapping
            records[msg.sender].push(User(_score, _description));
            scoreCount++;
            b = true;
        } else {
            //if it's a new user, add new score entry to mapping
            User[] storage x = records[msg.sender];
            x.push(User(_score, _description));
            userCount++;
            scoreCount++;
            b = true;
        }
        return b;
    }

    function getScore(address _wallet) public view returns (User[] memory r) {
        if (records[_wallet].length == 0) revert NoScoreHistory(_wallet);
        r = records[_wallet];
        r;
    }
}