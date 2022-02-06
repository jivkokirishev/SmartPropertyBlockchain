// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;


import "./User.sol";

contract RealEstate {
    User private owner;
    string private realEstateNotarialnoId;
    uint[5] private rating;

    constructor(User _owner, string memory _realEstateNotarialnoId) {
        owner = _owner;
        realEstateNotarialnoId = _realEstateNotarialnoId;
    }

    function getRealEstateNotarioalnoId() public view returns (string memory) {
        return realEstateNotarialnoId;
    }

    function setRating(uint rate) public {
        require(rate > 0 || rate < 6, "Rate must be between 1 and 5.");
        rating[rate - 1] += 1;
    }

    function getRating() public view returns (uint) {
        uint calculatedRating = 0;
        uint totalRateCount = 0;
        for (uint i = 0; i < 5; i++) {
            calculatedRating += (i + 1) * rating[i];
            totalRateCount += rating[i];
        }

        if (totalRateCount == 0) {
            return 0;
        }
        // solidity doesn't support real numbers :(
        return calculatedRating / totalRateCount;
    }

    // destructor
    
}

contract RealEstateFactory {
    RealEstate[] private properties;

    function createRealEstateRecord(User _owner, string memory _realEstateNotarialnoId) public returns(RealEstate) {
        RealEstate realEstate = new RealEstate(_owner, _realEstateNotarialnoId);
        properties.push(realEstate);

        return realEstate;
    }

    function getRealEstateByNotarialnoId(string memory _realEstateNotarialnoId) public {}
}
