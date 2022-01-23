// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract RealEstate {
    enum Status {
        AVAILABLE,
        UNDER_RENT,
        OUT_OF_THE_MARKET_FOR_NOW
    }

    Owner owner;
    string realEstateNotarialnoId;

    uint rating;

    Status status;

    constructor(){}
}

contract RealEstateFactory {
    RealEstate[] properties;

    new RealEstate();

    function getRealEstateBy...() {}
    function getAllProperties() {}
}
