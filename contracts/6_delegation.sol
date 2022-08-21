pragma solidity ^0.6.0;

import "hardhat/console.sol";

contract Script {

	function getStr() public {
		byteStr = abi.encodeWithSignature('pwn()');
		console.log('byteStr');
	}
}
