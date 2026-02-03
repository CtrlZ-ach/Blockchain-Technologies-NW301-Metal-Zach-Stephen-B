// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ServiceFeeHash {

    function calculateFee(uint serviceCode) public pure returns (uint) {
        if (serviceCode == 1) {
            // Consultation: 10,000 + 12% tax
            uint base = 10000;
            uint tax = (base * 12) / 100;
            return base + tax; // 11,200
        } 
        else if (serviceCode == 2) {
            // Documents: 2,000 + 10% service charge + 12% tax
            uint base = 2000;
            uint serviceCharge = (base * 10) / 100;
            uint subtotal = base + serviceCharge;
            uint tax = (subtotal * 12) / 100;
            return subtotal + tax; // 2,464
        } 
        else {
            revert("Invalid service code");
        }
    }

    function generateHash(uint serviceCode) public pure returns (bytes32) {
        // Fixed client details
        string memory message = "M s C";

        uint totalFee = calculateFee(serviceCode);
        uint firstDigit = totalFee / 10 ** (digits(totalFee) - 1);

        if (serviceCode == 1) {
            // abi.encodePacked
            return keccak256(
                abi.encodePacked(
                    message,
                    serviceCode,
                    firstDigit
                )
            );
        } else {
            // abi.encode
            return keccak256(
                abi.encode(
                    message,
                    serviceCode,
                    firstDigit
                )
            );
        }
    }

    function digits(uint x) internal pure returns (uint) {
        uint count = 0;
        while (x != 0) {
            x /= 10;
            count++;
        }
        return count;
    }
}
