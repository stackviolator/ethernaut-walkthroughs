pragma solidity ^0.6.0;

contract DoS {
  constructor() public {
  }

  receive() public payable {
    assert(false);
  }
}
