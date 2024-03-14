// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.15;

import {DSTestPlus} from "./utils/DSTestPlus.sol";

import {YFixedPointMathLib} from "../utils/YFixedPointMathLib.sol";

contract YFixedPointMathLibTest is DSTestPlus {
    function testMulWadDown() public {
        assertEq(YFixedPointMathLib.mulWadDown(2.5e18, 0.5e18), 1.25e18);
        assertEq(YFixedPointMathLib.mulWadDown(3e18, 1e18), 3e18);
        assertEq(YFixedPointMathLib.mulWadDown(369, 271), 0);
    }

    function testMulWadDownEdgeCases() public {
        assertEq(YFixedPointMathLib.mulWadDown(0, 1e18), 0);
        assertEq(YFixedPointMathLib.mulWadDown(1e18, 0), 0);
        assertEq(YFixedPointMathLib.mulWadDown(0, 0), 0);
    }

    function testMulWadUp() public {
        assertEq(YFixedPointMathLib.mulWadUp(2.5e18, 0.5e18), 1.25e18);
        assertEq(YFixedPointMathLib.mulWadUp(3e18, 1e18), 3e18);
        assertEq(YFixedPointMathLib.mulWadUp(369, 271), 1);
    }

    function testMulWadUpEdgeCases() public {
        assertEq(YFixedPointMathLib.mulWadUp(0, 1e18), 0);
        assertEq(YFixedPointMathLib.mulWadUp(1e18, 0), 0);
        assertEq(YFixedPointMathLib.mulWadUp(0, 0), 0);
    }

    function testDivWadDown() public {
        assertEq(YFixedPointMathLib.divWadDown(1.25e18, 0.5e18), 2.5e18);
        assertEq(YFixedPointMathLib.divWadDown(3e18, 1e18), 3e18);
        assertEq(YFixedPointMathLib.divWadDown(2, 100000000000000e18), 0);
    }

    function testDivWadDownEdgeCases() public {
        assertEq(YFixedPointMathLib.divWadDown(0, 1e18), 0);
    }

    function testFailDivWadDownZeroDenominator() public pure {
        YFixedPointMathLib.divWadDown(1e18, 0);
    }

    function testDivWadUp() public {
        assertEq(YFixedPointMathLib.divWadUp(1.25e18, 0.5e18), 2.5e18);
        assertEq(YFixedPointMathLib.divWadUp(3e18, 1e18), 3e18);
        assertEq(YFixedPointMathLib.divWadUp(2, 100000000000000e18), 1);
    }

    function testDivWadUpEdgeCases() public {
        assertEq(YFixedPointMathLib.divWadUp(0, 1e18), 0);
    }

    function testFailDivWadUpZeroDenominator() public pure {
        YFixedPointMathLib.divWadUp(1e18, 0);
    }

    function testMulDivDown() public {
        assertEq(YFixedPointMathLib.mulDivDown(2.5e27, 0.5e27, 1e27), 1.25e27);
        assertEq(YFixedPointMathLib.mulDivDown(2.5e18, 0.5e18, 1e18), 1.25e18);
        assertEq(YFixedPointMathLib.mulDivDown(2.5e8, 0.5e8, 1e8), 1.25e8);
        assertEq(YFixedPointMathLib.mulDivDown(369, 271, 1e2), 999);

        assertEq(YFixedPointMathLib.mulDivDown(1e27, 1e27, 2e27), 0.5e27);
        assertEq(YFixedPointMathLib.mulDivDown(1e18, 1e18, 2e18), 0.5e18);
        assertEq(YFixedPointMathLib.mulDivDown(1e8, 1e8, 2e8), 0.5e8);

        assertEq(YFixedPointMathLib.mulDivDown(2e27, 3e27, 2e27), 3e27);
        assertEq(YFixedPointMathLib.mulDivDown(3e18, 2e18, 3e18), 2e18);
        assertEq(YFixedPointMathLib.mulDivDown(2e8, 3e8, 2e8), 3e8);
    }

    function testMulDivDownEdgeCases() public {
        assertEq(YFixedPointMathLib.mulDivDown(0, 1e18, 1e18), 0);
        assertEq(YFixedPointMathLib.mulDivDown(1e18, 0, 1e18), 0);
        assertEq(YFixedPointMathLib.mulDivDown(0, 0, 1e18), 0);
    }

    function testFailMulDivDownZeroDenominator() public pure {
        YFixedPointMathLib.mulDivDown(1e18, 1e18, 0);
    }

    function testMulDivUp() public {
        assertEq(YFixedPointMathLib.mulDivUp(2.5e27, 0.5e27, 1e27), 1.25e27);
        assertEq(YFixedPointMathLib.mulDivUp(2.5e18, 0.5e18, 1e18), 1.25e18);
        assertEq(YFixedPointMathLib.mulDivUp(2.5e8, 0.5e8, 1e8), 1.25e8);
        assertEq(YFixedPointMathLib.mulDivUp(369, 271, 1e2), 1000);

        assertEq(YFixedPointMathLib.mulDivUp(1e27, 1e27, 2e27), 0.5e27);
        assertEq(YFixedPointMathLib.mulDivUp(1e18, 1e18, 2e18), 0.5e18);
        assertEq(YFixedPointMathLib.mulDivUp(1e8, 1e8, 2e8), 0.5e8);

        assertEq(YFixedPointMathLib.mulDivUp(2e27, 3e27, 2e27), 3e27);
        assertEq(YFixedPointMathLib.mulDivUp(3e18, 2e18, 3e18), 2e18);
        assertEq(YFixedPointMathLib.mulDivUp(2e8, 3e8, 2e8), 3e8);
    }

    function testMulDivUpEdgeCases() public {
        assertEq(YFixedPointMathLib.mulDivUp(0, 1e18, 1e18), 0);
        assertEq(YFixedPointMathLib.mulDivUp(1e18, 0, 1e18), 0);
        assertEq(YFixedPointMathLib.mulDivUp(0, 0, 1e18), 0);
    }

    function testFailMulDivUpZeroDenominator() public pure {
        YFixedPointMathLib.mulDivUp(1e18, 1e18, 0);
    }

    function testRPow() public {
        assertEq(YFixedPointMathLib.rpow(2e27, 2, 1e27), 4e27);
        assertEq(YFixedPointMathLib.rpow(2e18, 2, 1e18), 4e18);
        assertEq(YFixedPointMathLib.rpow(2e8, 2, 1e8), 4e8);
        assertEq(YFixedPointMathLib.rpow(8, 3, 1), 512);
    }

    function testSqrt() public {
        assertEq(YFixedPointMathLib.sqrt(0), 0);
        assertEq(YFixedPointMathLib.sqrt(1), 1);
        assertEq(YFixedPointMathLib.sqrt(2704), 52);
        assertEq(YFixedPointMathLib.sqrt(110889), 333);
        assertEq(YFixedPointMathLib.sqrt(32239684), 5678);
        assertEq(YFixedPointMathLib.sqrt(type(uint256).max), 340282366920938463463374607431768211455);
    }

    function testSqrtBackHashedSingle() public {
        testSqrtBackHashed(123);
    }

    function testMulWadDown(uint256 x, uint256 y) public {
        // Ignore cases where x * y overflows.
        unchecked {
            if (x != 0 && (x * y) / x != y) return;
        }

        assertEq(YFixedPointMathLib.mulWadDown(x, y), (x * y) / 1e18);
    }

    function testFailMulWadDownOverflow(uint256 x, uint256 y) public pure {
        // Ignore cases where x * y does not overflow.
        unchecked {
            if ((x * y) / x == y) revert();
        }

        YFixedPointMathLib.mulWadDown(x, y);
    }

    function testMulWadUp(uint256 x, uint256 y) public {
        // Ignore cases where x * y overflows.
        unchecked {
            if (x != 0 && (x * y) / x != y) return;
        }

        assertEq(YFixedPointMathLib.mulWadUp(x, y), x * y == 0 ? 0 : (x * y - 1) / 1e18 + 1);
    }

    function testFailMulWadUpOverflow(uint256 x, uint256 y) public pure {
        // Ignore cases where x * y does not overflow.
        unchecked {
            if ((x * y) / x == y) revert();
        }

        YFixedPointMathLib.mulWadUp(x, y);
    }

    function testDivWadDown(uint256 x, uint256 y) public {
        // Ignore cases where x * WAD overflows or y is 0.
        unchecked {
            if (y == 0 || (x != 0 && (x * 1e18) / 1e18 != x)) return;
        }

        assertEq(YFixedPointMathLib.divWadDown(x, y), (x * 1e18) / y);
    }

    function testFailDivWadDownOverflow(uint256 x, uint256 y) public pure {
        // Ignore cases where x * WAD does not overflow or y is 0.
        unchecked {
            if (y == 0 || (x * 1e18) / 1e18 == x) revert();
        }

        YFixedPointMathLib.divWadDown(x, y);
    }

    function testFailDivWadDownZeroDenominator(uint256 x) public pure {
        YFixedPointMathLib.divWadDown(x, 0);
    }

    function testDivWadUp(uint256 x, uint256 y) public {
        // Ignore cases where x * WAD overflows or y is 0.
        unchecked {
            if (y == 0 || (x != 0 && (x * 1e18) / 1e18 != x)) return;
        }

        assertEq(YFixedPointMathLib.divWadUp(x, y), x == 0 ? 0 : (x * 1e18 - 1) / y + 1);
    }

    function testFailDivWadUpOverflow(uint256 x, uint256 y) public pure {
        // Ignore cases where x * WAD does not overflow or y is 0.
        unchecked {
            if (y == 0 || (x * 1e18) / 1e18 == x) revert();
        }

        YFixedPointMathLib.divWadUp(x, y);
    }

    function testFailDivWadUpZeroDenominator(uint256 x) public pure {
        YFixedPointMathLib.divWadUp(x, 0);
    }

    function testMulDivDown(uint256 x, uint256 y, uint256 denominator) public {
        // Ignore cases where x * y overflows or denominator is 0.
        unchecked {
            if (denominator == 0 || (x != 0 && (x * y) / x != y)) return;
        }

        assertEq(YFixedPointMathLib.mulDivDown(x, y, denominator), (x * y) / denominator);
    }

    function testFailMulDivDownOverflow(uint256 x, uint256 y, uint256 denominator) public pure {
        // Ignore cases where x * y does not overflow or denominator is 0.
        unchecked {
            if (denominator == 0 || (x * y) / x == y) revert();
        }

        YFixedPointMathLib.mulDivDown(x, y, denominator);
    }

    function testFailMulDivDownZeroDenominator(uint256 x, uint256 y) public pure {
        YFixedPointMathLib.mulDivDown(x, y, 0);
    }

    function testMulDivUp(uint256 x, uint256 y, uint256 denominator) public {
        // Ignore cases where x * y overflows or denominator is 0.
        unchecked {
            if (denominator == 0 || (x != 0 && (x * y) / x != y)) return;
        }

        assertEq(YFixedPointMathLib.mulDivUp(x, y, denominator), x * y == 0 ? 0 : (x * y - 1) / denominator + 1);
    }

    function testFailMulDivUpOverflow(uint256 x, uint256 y, uint256 denominator) public pure {
        // Ignore cases where x * y does not overflow or denominator is 0.
        unchecked {
            if (denominator == 0 || (x * y) / x == y) revert();
        }

        YFixedPointMathLib.mulDivUp(x, y, denominator);
    }

    function testFailMulDivUpZeroDenominator(uint256 x, uint256 y) public pure {
        YFixedPointMathLib.mulDivUp(x, y, 0);
    }

    function testDifferentiallyFuzzSqrt(uint256 x) public {
        assertEq(YFixedPointMathLib.sqrt(x), uniswapSqrt(x));
        assertEq(YFixedPointMathLib.sqrt(x), abdkSqrt(x));
    }

    function testSqrt(uint256 x) public {
        uint256 root = YFixedPointMathLib.sqrt(x);
        uint256 next = root + 1;

        // Ignore cases where next * next overflows.
        unchecked {
            if (next * next < next) return;
        }

        assertTrue(root * root <= x && next * next > x);
    }

    function testSqrtBack(uint256 x) public {
        unchecked {
            x >>= 128;
            while (x != 0) {
                assertEq(YFixedPointMathLib.sqrt(x * x), x);
                x >>= 1;
            }
        }
    }

    function testSqrtBackHashed(uint256 x) public {
        testSqrtBack(uint256(keccak256(abi.encode(x))));
    }

    function uniswapSqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }

    function abdkSqrt(uint256 x) private pure returns (uint256) {
        unchecked {
            if (x == 0) return 0;
            else {
                uint256 xx = x;
                uint256 r = 1;
                if (xx >= 0x100000000000000000000000000000000) {
                    xx >>= 128;
                    r <<= 64;
                }
                if (xx >= 0x10000000000000000) {
                    xx >>= 64;
                    r <<= 32;
                }
                if (xx >= 0x100000000) {
                    xx >>= 32;
                    r <<= 16;
                }
                if (xx >= 0x10000) {
                    xx >>= 16;
                    r <<= 8;
                }
                if (xx >= 0x100) {
                    xx >>= 8;
                    r <<= 4;
                }
                if (xx >= 0x10) {
                    xx >>= 4;
                    r <<= 2;
                }
                if (xx >= 0x8) {
                    r <<= 1;
                }
                r = (r + x / r) >> 1;
                r = (r + x / r) >> 1;
                r = (r + x / r) >> 1;
                r = (r + x / r) >> 1;
                r = (r + x / r) >> 1;
                r = (r + x / r) >> 1;
                r = (r + x / r) >> 1; // Seven iterations should be enough
                uint256 r1 = x / r;
                return r < r1 ? r : r1;
            }
        }
    }
}
