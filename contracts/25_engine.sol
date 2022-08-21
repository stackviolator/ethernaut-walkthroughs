pragma solidity ^0.6.0;

contract SpontaneousCombustion {
	function destruct() public {
		selfdestruct(address(0));
	}
}
