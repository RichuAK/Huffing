// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Vm} from "forge-std/Vm.sol";
import "forge-std/Script.sol";
// import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {CampToken} from "../src/CampToken.sol";
import {compile, create, appendArgs} from "huff-runner/src/Deploy.sol";

using {compile} for Vm;
using {create} for bytes;
using {appendArgs} for bytes;

contract HuffDeployScript is Script {
    function run() external {
        bytes32[] memory arguments;
        arguments = new bytes32[](2);
        arguments[0] = "CTFToken";
        arguments[1] = "CTF";
        vm.broadcast();

        address deployment = vm.compile("src/CampToken.huff").appendArgs(arguments).create({value: 0});

        // vm.stopBroadcast();
    }
}
