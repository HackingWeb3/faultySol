// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Secrets {
  uint256 public pin = 123456789;
  bool public locked;
  bytes32 private password;
  string private description = "The super cool secret token";
  address private token = 0x36A3677be606E5EA7a5B052cef06e95972fEFe0B;


  constructor(bytes32 _password) public {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}
