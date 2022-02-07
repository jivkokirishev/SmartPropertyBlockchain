// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

import "./User.sol";
import "./RealEstate.sol";

contract RealEstateRentContract {
    enum Status {
        DEPLOY_DEPOSIT,
        RENT_PAYED,
        RENT_NOT_PAYED_FOR_30_DAYS,
        RENT_NOT_PAYED_AND_NO_DEPOSIT,
        CHANGE_TRIGGERED,
        CAN_BE_CONTINUED,
        CAN_BE_DESTROYED,
        MUTUAL_AGREEMENT_DESTRUCTION_SIGNATURE ??
    }

    struct ContractData {
        User owner;
        User tenant;
        uint rentInGWei;
        RealEstate realEstateAddress;
        uint contractEndDateUnixTimestamp;
        uint depositInGwei;
    }

    struct Payment {
        uint price;
        uint paymentUnixTimestamp;
        // add date
    }

    ContractData contractData;
    ContractData futureContractData;

    Payment[] private paymentHistory;

    mapping(uint => string) private dateToREInteriorImagesLink;

    Status private contractStatus;

    bool private ownerSign;
    bool private tenantSign;

    constructor(
        address _owner,
        address _tenant,
        uint _rentInGwei,
        RealEstate _realEstateAddress,
        uint _contractEndDateUnixTimestamp
    ) {
        
    }

    modifier onlyOwner {
        require(msg.sender == owner.getEthPaymentAddress());
        _;
    }
    modifier onlyTenant {
        require(msg.sender == tenant.getEthPaymentAddress());
        _;
    }

    modifier ownerOrTenant {
        require(msg.sender == owner.getEthPaymentAddress() || msg.sender == tenant.getEthPaymentAddress());
        _;
    }

    modifier ownerSign {
        require(ownerSign == true);
        _;
    }
    modifier tenantSign {
        require(tenantSign == true);
        _;
    }

    modifier nextMonthOrOwnerAgreement {}
    modifier notPayedLastMonth {}

    onlyOwner
    function proposeChange() {}

    ownerSign, tenantSign
    function applyChange() {}

    tenant, nextMonthOrOwnerAgreement
    function payRent() payable {}

    onlyTenant, specificState
    function deployDeposit() {}

    ownerSign, tenantSign
    function destroyContractByMutualAgreement() {} // AndLockTheDoor

    onlyOwner, notPayedLastMonth
    function destroyContractBecauseTenantDidntPay() {} // AndLockTheDoor

    onlyOwner, notPayedLastMonthOrMutualAgreement
    function takeDeposit() {}

    tenant, ownerSign
    function returnDeposit() {}

    ownerOrTenant
    function uploadREInteriorImagesLink() {}
}

contract ContractFactory {

    modifier onlyPlatform {} ??

    function createRentalContract() onlyPlatform {
        new RealEstateRentContract();
    }
}
