// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {CampToken} from "../src/CampToken.sol";
// import {compile, create, appendArgs} from "huff-runner/src/Deploy.sol";

// using {compile} for vm;
// using {create} for bytes;

contract CampTokenDeployScript is Script {
    CampToken token;
    string public constant NFT_NAME = "CTFToken";
    string public constant NFT_SYMBOL = "CTF";

    function run() external {
        vm.broadcast();

        token = CampToken(
            HuffDeployer.config().with_args(bytes.concat(abi.encode(NFT_NAME), abi.encode(NFT_SYMBOL))).deploy(
                "CampToken"
            )
        );

        vm.stopBroadcast();
    }
}
