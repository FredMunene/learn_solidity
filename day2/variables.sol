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
}
