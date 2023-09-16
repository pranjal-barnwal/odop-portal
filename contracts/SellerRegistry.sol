// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract SellerRegistry {

    struct Seller {
        address sellerAddress; // Ethereum address of the seller
        string name;          // Name of the seller
        string mobile;       // mobile number of the seller
        bool isRegistered;    // Flag indicating if the seller is registered
    }

    // Mapping to store sellers' information by their Ethereum address
    mapping(address => Seller) public sellers;          // creating a map based on seller id

    // Event to notify when a new seller is registered
    event SellerRegistered(address indexed sellerAddress, string name, string mobile);

    // Function to register a new seller
    function registerSeller(string memory _name, string memory _mobile) public {
        // Ensure that the seller is not already registered
        require(!sellers[msg.sender].isRegistered, "Seller already registered");

        // Create a new seller object
        Seller memory newSeller = Seller({
            sellerAddress: msg.sender,
            name: _name,
            mobile: _mobile,
            isRegistered: true
        });

        // Store the seller's information in the mapping
        sellers[msg.sender] = newSeller;

        // Emit an event to notify the registration
        emit SellerRegistered(msg.sender, _name, _mobile)   ;
    }

    // Function to check if a seller is registered
    function isSellerRegistered() public view returns (bool) {
        return sellers[msg.sender].isRegistered;
    }
}
