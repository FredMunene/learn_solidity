// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GiftRegistry {
    // structure of the gift
    struct Gift {
        string name;
        address buyer;
        uint price;
        bool isPurchased;
    }
    // array to hold Gifts
    Gift[] gifts;
    // events 
    event GiftAdded(string name, uint price);
    event GiftPurchased(uint giftIndex, address buyer);
    /**
     *@dev Add a gift to the registry
     *@param _name Name of the gift 
     *@param _price Rice of the gift
    **/
    function addGift(string memory _name, uint _price) public {
        require(bytes(_name).length > 0,"Name cannot be empty");
        require(_price > 0, "Gift price must be greater than zero");

        gifts.push(Gift({
                name: _name,
                price: _price,
                buyer: address(0),
                isPurchased: false
            }));

        emit GiftAdded(_name, _price);
    }
    /**
     *@dev Purchase a gift from registry
     *@param _index Index of the gift in registry
    **/
    function purchaseGift(uint _index) public payable {
        require(_index < gifts.length, "Gift does not exist");

        Gift storage gift = gifts[_index];
        require(!gift.isPurchased, "Gift already purchased");
        require(msg.value >= gift.price, "Insufficient funds to purchase gift");

        gift.isPurchased = true;
        gift.buyer = msg.sender;

        emit GiftPurchased(_index, msg.sender);
    }
    /**
    *@dev Get details of a specific gift
    *param _index Index of the gift in the registry
    * return name, price, buyer, is purchased
    **/
    function getGift(uint _index) public view returns (string memory, uint, address, bool){
        require(_index < gifts.length, "Gift does not exist");

        Gift storage gift = gifts[_index];

        return (gift.name, gift.price, gift.buyer, gift.isPurchased);
    }

    /**
    *@dev Get the total number of gifts in registry
    *return total number of gifts
    **/
    function getGiftCount() public view returns (uint) {
        return gifts.length;
    }
}
