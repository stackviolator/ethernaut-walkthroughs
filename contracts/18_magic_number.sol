pragma solidity ^0.6.0;

contract asm {
  constructor() public {}

  function whatIsTheMeaningOfLife() public returns (uint) {
    assembly {
      mstore(0x00, 0x2A)
        return(0x0, 0x40)
    }
  }
}

/*
RUNTIME OPCODES
PUSH1 2a    60 2a
PUSH1 00    60 00
MSTORE      52
PUSH1 20    60 20
PUSH1 00    60 00
RETURN      f3

INITIALIZATION OPCODES

PUSH 0a     60 0a
PUSH 0c     60 0c
PUSH 00     60 00
CODECOPY    39
PUSH 0a     60 0a
PUSH 00     60 00
RETURN      f3

0x600a600c600039600a6000f3602a60005260206000f3

CODECOPY
PUSH LENGTH RUNTIME CODE
PUSH CURRENT OFFSET (HOW MANY BYTES THE INITIALIZATION SEQ TAKES UP)
PUSH DESTINATION ADDRESS (OFFSET)

RETURN
PUSH LENGTH OF VALUE TO BE RETURNED
PUSH OFFSET
RETURN


0x602a60805260206000F3
*/

contract code {
  constructor() public {}

  function whatIsTheMeaningOfLife() public returns (uint) {
    return 42;
  }
}

