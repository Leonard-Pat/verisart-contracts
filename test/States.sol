// SPDX-License-Identifier: No License

pragma solidity ^0.8.15;
import "forge-std/Test.sol";
import "../src/Certificates.sol";


abstract contract ZeroState is Test {

    Certificates certificateContract;
    address public deployer = vm.addr(1);
    address public userOne = vm.addr(2);
    string public fakeURI = "https://test-certificate.infura-ipfs.io/ipfs/QmVc9pMES6FLn2hxVzs7TiVgrzVBKwn4iTYFoA9MECKxVR";


    function setUp() public virtual {
        vm.prank(deployer);
        certificateContract = new Certificates();

        vm.label(userOne, "User 1");
        vm.label(deployer, "Deployer");
        vm.label(address(certificateContract), "Certificate Contract");
        

    }
    
}

abstract contract InsertArtState is ZeroState {

    function setUp() public virtual override{
        super.setUp();
        vm.prank(userOne);
        certificateContract.createCertificate(fakeURI);
    }
}