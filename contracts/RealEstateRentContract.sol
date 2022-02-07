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
        MUTUAL_AGREEMENT_DESTRUCTION_SIGNATURE
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
        uint rentMonth;
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
        contractData = ContractData(_owner, _tenant, _rentInGwei, _realEstateAddress, _contractEndDateUnixTimestamp, 0);
        contractStatus = Status.DEPLOY_DEPOSIT;
    }

    modifier onlyOwner {
        require(msg.sender == contractData.owner.getEthPaymentAddress());
        _;
    }
    modifier onlyTenant {
        require(msg.sender == contractData.tenant.getEthPaymentAddress());
        _;
    }

    modifier ownerOrTenant {
        require(msg.sender == contractData.owner.getEthPaymentAddress() || msg.sender == contractData.tenant.getEthPaymentAddress());
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

    modifier nextMonthOrOwnerAgreement {
        // Not implemented yet
        _;
    }
    modifier notPayedLastMonth {
        // Not implemented yet
        _;
    }

    modifier specificStatus(Status _status) {
        require(contractStatus == _status);
        _;
    }

    function proposeChange() public onlyOwner {}

    function applyChange() public ownerSign tenantSign {}

    function payRent() payable public onlyTenant nextMonthOrOwnerAgreement {}

    function deployDeposit() public onlyTenant specificStatus(Status.DEPLOY_DEPOSIT) {}

    function destroyContractByMutualAgreement() public ownerSign tenantSign {}

    function destroyContractBecauseTenantDidntPay() public onlyOwner notPayedLastMonth {}

    function takeDeposit() public onlyOwner specificStatus(Status.RENT_NOT_PAYED_FOR_30_DAYS) {}

    function returnDeposit() public onlyTenant ownerSign {}

    function uploadREInteriorImagesLink() public ownerOrTenant {}
}

contract ContractFactory {

    RealEstateRentContract[] private rentContracts;

    modifier onlyPlatform {
        // Not implemented yet
        //  address(0) should be the eth address of the SmartProperty platform
        require(msg.sender == address(0));
        _;
    }

    function createRentalContract(
        address _owner,
        address _tenant,
        uint _rentInGwei,
        RealEstate _realEstateAddress,
        uint _contractEndDateUnixTimestamp
    ) public onlyPlatform {
        rentContract = new RealEstateRentContract(_owner, _tenant, _rentInGwei, _realEstateAddress, _contractEndDateUnixTimestamp);
        rentContracts.add(rentContract);
    }
}
