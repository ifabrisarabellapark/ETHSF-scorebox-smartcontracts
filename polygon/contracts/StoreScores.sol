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

    constructor() Ownable() {
        userCount = 0;
        scoreCount = 0;
    }

    function uploadScore(
        int16 _score,
        string calldata _description,
    ) public payable returns (bool b) {
        b = false;

        if (records[msg.sender].length != 0) {
            //new user
            records[msg.sender].push(User(_score, _description));
            userCount++;
            scoreCount++;
            b = true;
        } else {
            //returning user
            User[] storage x = records[msg.sender];
            x.push(User(_score, _description));
            scoreCount++;
            b = true;
        }
        return b;
    }
}