// SPDX-License-Identifier: UNKNOWN
pragma solidity ^0.8.14;

// Each position is identified by the (owner address, lower tick and upper tick), hash of these values is used as the key

library Position {
    struct Info {
        uint128 liquidity;
    }

    function get(mapping(bytes32 => Info) storage self, address owner, int24 lowerTick, int24 upperTick)
        internal
        view
        returns (Position.Info storage position)
    {
        position = self[keccak256(abi.encodePacked(owner, lowerTick, upperTick))];
    }

    function update(Info storage self, uint128 liquidityDelta) internal {
        uint128 liquidityBefore = self.liquidity;
        uint128 liquidityAfter = liquidityBefore + liquidityDelta;

        self.liquidity = liquidityAfter;
    }
}
