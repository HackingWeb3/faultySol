// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import '@openzeppelin/contracts/math/SafeMath.sol';

/* Fallback contract keeps track of the top score in a game
The top player gets to end the game. The point of this contract is to hack and become
the top player and end the game  */

contract Fallback {

  using SafeMath for uint256;
  address payable public topPlayer;
  mapping(address => uint) public points;

    constructor() public {
      topPlayer = msg.sender;
      points[msg.sender] = 1000 * (1 ether);
    }

    modifier onlyTopScore {
            require(
                msg.sender == topPlayer,
                "caller is not the top player"
            );
            _;
        }

    function endGame() public onlyTopScore {
      topPlayer.transfer(address(this).balance);
    }

    function addPoints() public payable {
      require(msg.value < 0.001 ether);
      points[msg.sender] += msg.value;
      if(points[msg.sender] > points[topPlayer]) {
        topPlayer = msg.sender;
      }

    }

  receive() external payable {
    require(msg.value > 0 && points[msg.sender] > 0);
    topPlayer = msg.sender;
  }


}
