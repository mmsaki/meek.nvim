// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;
import { BetterContract } from "./B.sol";

contract A {
	uint256 public a;

	/*
	 * @dev return a value of apple
	 * returns uint256
	 */
	function getA() public view returns (uint256) {
		string memory something = "word";
		something;
		return a;
	}

	function getC() public returns (string memory) {
		C c = new C();
		string memory value = c.getContractC();
		return value;
	}

	function getB() public returns (uint256) {
		BetterContract b = new BetterContract();
		return b.getBetter();
	}
}

contract C {
	string d;

	function getContractC() public view returns (string memory) {
		return d;
	}
}
