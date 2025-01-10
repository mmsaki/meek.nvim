pragma solidity 0.8.13;

contract B {
	uint256 b;

	function getB() view public returns (uint256) {
		return b;
	}
}
