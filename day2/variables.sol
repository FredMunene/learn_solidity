// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract ChristMasWishlist{

    // String 
    // uint ; non-negative
    // bool

    string public  owner;
    uint public totalIteams;
    bool public isPublic;

    // Array
    string[] public wishList;

    // Map
    mapping (address => string[]) public userWishlists;

    // Allow users to add items
    function addItem(string memory item) public {
        userWishlists[msg.sender].push(item);
    }

    // Allow user to see their wishlidt
    function getWishlist() public view returns (string[] memory){
        return userWishlists[msg.sender];
    }

    // Adding a boolean variable to toggle visibility
    function toggleVisibility(bool status) public {
        isPublic = status;
    }

}
