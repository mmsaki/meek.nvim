pragma solidity 0.8.13;
import {B} from "./B.sol";

contract A {
	uint256 a;
	bytes32 b;

	function getA() public returns (uint256) {
		C c = new C();
		return a;
	}

	function getB() public view returns (bytes32) {
		return b;
	}
}

contract C {
	string d;

	function getD() public view returns (string memory) {
		return d;
	}
}
