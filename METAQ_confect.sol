// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

library Address {
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

contract MetaQToken {
	string public name = "METAQ Token";
	string public symbol = "METAQ";
	uint256 public totalSupply;
	uint8 public decimals = 8;
	uint256 initialSupply = 1000000000;
	uint8 multiLength = 50;

	mapping(address => uint256) balances;

	event Transfer(address indexed from, address indexed to, uint256 amount);

	constructor() {
		totalSupply=initialSupply * (10 ** uint256(decimals)); 
		balances[msg.sender]=totalSupply;
		transfer(msg.sender,totalSupply);
	}
	receive () external payable {
		revert();
	}
	fallback() external payable {
		revert();
	}

	function transfer(address to, uint256 amount) public {
		require(0<amount,"METAQ: Transfer to the zero amount");
		require(to!=address(0),"METAQ: Transfer to the zero address");
		require(!Address.isContract(to),"METAQ: Transfer to the contract address");
		balances[msg.sender]-=amount;
		balances[to]+=amount;
		emit Transfer(msg.sender,to,amount);
	}
	function transferMulti(address[] memory to, uint256[] memory amount) public {
		require(to.length<=multiLength,"METAQ: Maximum length over.");
		require(to.length==amount.length,"METAQ: Not match length.");
		for(uint8 i=0;i<to.length;i++) {
			transfer(to[i],amount[i]);
		}
	}

	function balanceOf(address target) public view returns (uint256 balance) {
		return balances[target];
	}
}