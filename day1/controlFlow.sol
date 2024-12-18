// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Control {
    function chekELigibility(uint age) public pure returns (string memory) {
        if (age >= 18){
            return "Eligible for the gift registry";
        } else {
            return "Not eligible";
        }
    }
}
