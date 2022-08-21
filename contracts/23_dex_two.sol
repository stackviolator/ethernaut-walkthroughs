pragma solidity ^0.6.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract attackerTwo is ERC20 {

  constructor (uint amount) ERC20("GakeCoin", "GKE"){
    _mint(msg.sender, amount);
  }
}
