//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC721/presets/ERC721PresetMinterPauserAutoIdUpgradeable.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract ERC721FactoryClone {
    address immutable tokenImplementation;

    constructor() {
        tokenImplementation = address(new ERC721PresetMinterPauserAutoIdUpgradeable());
    }

    function createToken(string calldata name, string calldata symbol, string calldata baseTokenURI) external returns (address) {
        address clone = Clones.clone(tokenImplementation);
        ERC721PresetMinterPauserAutoIdUpgradeable(clone).initialize(name, symbol, baseTokenURI);
        return clone;
    }
}
