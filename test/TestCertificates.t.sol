// SPDX-License-Indentifier: No License

pragma solidity ^0.8.15;

import "../test/States.sol";
import "../src/Certificates.sol";


contract testInsertArtState is InsertArtState {
    function testGetURI() public {
        assertEq(certificateContract.tokenURI(0), "https://test-certificate.infura-ipfs.io/ipfs/QmVc9pMES6FLn2hxVzs7TiVgrzVBKwn4iTYFoA9MECKxVR");
    }

    function testBalanceOfCertificate() public {
        vm.prank(userOne);
        assertEq(1, certificateContract.balanceOf(userOne));
    }

    function testOwnerOf() public {
        vm.prank(userOne);
        assertEq(userOne, certificateContract.ownerOf(0));
    }
}
