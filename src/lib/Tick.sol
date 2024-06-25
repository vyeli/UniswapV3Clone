// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.14;

library Tick {
    struct Info {
        bool initialized;
        uint128 liquidity;
    }

    function update(mapping(int24 => Tick.Info) storage self, int24 tick, uint128 liquidityDelta) internal {
        // Using storage to modify the state of the mapping and persist the changes
        // It is important to note that the mapping is passed by reference and the changes are persisted
        Tick.Info storage tickInfo = self[tick];
        uint128 liquidityBefore = tickInfo.liquidity;
        uint128 liquidityAfter = liquidityBefore + liquidityDelta;
        // Update the liquidity of the ticks, if the tick is not initialized, it will be initialized
        if (liquidityBefore == 0) {
            tickInfo.initialized = true;
        }

        tickInfo.liquidity = liquidityAfter;
    }
}
