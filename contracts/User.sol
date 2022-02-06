// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract User {
    address private idenaAddress;
    address private ethPaymentAddress;

    constructor(address _idenaAddress, address _ethPaymentAddress) {
        idenaAddress = _idenaAddress;
        ethPaymentAddress = _ethPaymentAddress;
    }

    function getIdenaAddress() public view returns(address) {
        return idenaAddress;
    }

    function setEthPaymentAddress(address _ethPaymentAddress) public {
        ethPaymentAddress = _ethPaymentAddress;
    }

    function getEthPaymentAddress() public view returns(address) {
        return ethPaymentAddress;
    }

    // destructor
}

contract UserFactory {
    User[] owners;
    User[] tenants;

    // For now we won't implement user rating
    // mapping(address => uint) ownerRating;
    // mapping(address => uint) tenantRating;


    function createOwner(address _idenaAddress, address _ethPaymentAddress) public returns(User) {
        User owner = new User(_idenaAddress, _ethPaymentAddress);
        owners.push(owner);

        return owner;
    }

    function createTenant(address _idenaAddress, address _ethPaymentAddress) public returns(User) {
        User tenant = new User(_idenaAddress, _ethPaymentAddress);
        tenants.push(tenant);

        return tenant;
    }
    
    function getOwnerByIdenaAddress() public {}
    function getAllOwners() public {}

    function getTenantByIdenaAddress() public {}
    function getAllTenants() public {}

}
