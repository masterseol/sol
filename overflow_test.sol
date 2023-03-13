// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

contract myTest {
	event eventlog(uint256 indexed time, uint8 value);
	function safeAdd(uint8 a, uint8 b) public returns (uint8 c) {
		c = a + b;
		emit eventlog(block.timestamp, c);
	}
	function safeSub(uint8 a, uint8 b) public returns (uint8 c) {
		c = a - b;
		emit eventlog(block.timestamp, c);
	}
	function safeMul(uint8 a, uint8 b) public returns (uint8 c) {
		c = a * b;
		emit eventlog(block.timestamp, c);
	}
	function safeDiv(uint8 a, uint8 b) public returns (uint8 c) {
		c = a / b;
		emit eventlog(block.timestamp, c);
	}
	function getTime() public view returns (uint256) {
		return block.timestamp;
	}
}
