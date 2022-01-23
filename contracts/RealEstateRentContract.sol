// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract RealEstateRentContract {
    enum Status {
        DEPLOY_DEPOSIT,
        DEFAULT,
        CHANGE_TRIGGERED,
        MUTUAL_AGREEMENT_DESTRUCTION_SIGN,
        CAN_BE_DESTROYED
    }

    struct ContractData {
        Owner owner;
        Tenant tenant;
        uint rentInGWei;
        RealEstate realEstateAddress;
        uint contractEndDateUnixTimestamp;
        uint depositInGwei;
    }

    struct Payment {
        uint price;
        uint paymentUnixTimestamp;
    }

    ContractData contractData;
    ContractData futureContractData;

    Payment[] paymentHistory;

    mapping(uint => string) dateToREInteriorImagesLink

    Status contractStatus;

    bool ownerSign;
    bool tenantSign;

    constructor(
        address _owner,
        address _tenant,
        uint _rentInGwei,
        RealEstate _realEstateAddress,
        uint _contractEndDateUnixTimestamp
    ) {
        
    }

    modifier owner{}
    modifier tenant{}

    modifier ownerSign {}
    modifier tenantSign {}

    modifier nextMonthOrOwnerAgreement {}
    modifier notPayedLastMonth {}

    owner
    function makeChange() {}

    ownerSign, tenantSign
    function applyChange() {}

    tenant, nextMonthOrOwnerAgreement
    function payRent() payable {}

    ownerSign, tenantSign
    function destroyContractByMutualAgreement() {} // AndLockTheDoor

    owner, notPayedLastMoth
    function destroyContractBecauseTenantDontPays() {} // AndLockTheDoor

    owner, notPayedLastMonthOrMutualAgreement
    function takeDeposit() {}

    tenant, ownerSign
    function returnDeposit() {}

    owner, tenant
    function uploadREInteriorImagesLink() {}
}


contract RealEstateSellingContract {
    enum Status {
        DEPLOY_DEPOSIT,
        DEFAULT,
        CHANGE_TRIGGERED,
        MUTUAL_AGREEMENT_DESTRUCTION_SIGN,
        CAN_BE_DESTROYED
    }

    struct ContractData {
        address owner;
        address tenant;
        uint rentInGWei;
        string realEstateNotarialnoId;
        uint contractEndDateUnixTimestamp;
        uint depositInGwei;
    }

    struct Payment {
        uint price;
        uint paymentUnixTimestamp;
    }

    ContractData contractData;
    ContractData futureContractData;

    Payment[] paymentHistory;

    mapping(uint => string) dateToREInteriorImagesLink

    Status contractStatus;

    bool ownerSign;
    bool tenantSign;

    constructor(
        address _owner,
        address _tenant,
        uint _rentInGwei,
        string _realEstateNotarialnoId,
        uint _contractEndDateUnixTimestamp
    ) {
        
    }

    modifier owner{}
    modifier tenant{}

    modifier ownerSign {}
    modifier tenantSign {}

    modifier nextMonthOrOwnerAgreement {}
    modifier notPayedLastMonth {}

    owner
    function makeChange() {}

    ownerSign, tenantSign
    function applyChange() {}

    tenant, nextMonthOrOwnerAgreement
    function payRent() payable {}

    ownerSign, tenantSign
    function destroyContractByMutualAgreement() {} // AndLockTheDoor

    owner, notPayedLastMoth
    function destroyContractBecauseTenantDontPays() {} // AndLockTheDoor

    owner, notPayedLastMonthOrMutualAgreement
    function takeDeposit() {}

    tenant, ownerSign
    function returnDeposit() {}

    owner, tenant
    function uploadREInteriorImagesLink() {}

    tenant
    function rateRealEstate() {}
    tenant
    function rateOwner() {}

    owner
    function rateTenant() {}
}

contract ContractFactory {

    modifier onlyPlatform {} ??

    onlyPlatform ??
    function createRentalContract() {
        new RealEstateRentContract();
    }
}
