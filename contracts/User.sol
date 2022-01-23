// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract User {
    address idenaAddress;
    address ethPaymentAddress;
}

contract Owner {
    User user;
    uint rating;
}

contract Tenant {
    User user;
    uint rating;
}

contract UserFactory {
    Owner[] owners;
    Tenant[] tenants;

    // or delete Owner and Tenant and use only User like this
    mapping(User => uint) ownerRating;
    mapping(User => uint) tenantRating;

    function createUser() {
        new User();
    }

    function createOwner(User user) {
        new Owner();
    }

    function createTenant(User user) {
        new Tenant();
    }
    
    function getOwnerByIdenaAddress() {}
    function getAllOwners() {}

    function getTenantByIdenaAddress() {}
    function getAllTenants() {}

}
