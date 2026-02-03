// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Quiz2StringHash {

    string public fullName = "Zach Stephen Metal"; 

    string public barangayExtract;
    string public cityExtract;
    string public provinceExtract;
    string public countryExtract;

    string public combinedString;

    bytes32 public hashUsingAbiEncode;
    bytes32 public hashUsingAbiEncodePacked;

    function processStrings(
        string memory barangay,
        string memory city,
        string memory province,
        string memory country
    ) public {

        require(bytes(barangay).length >= 2, "Barangay must have at least 2 characters");
        require(bytes(city).length >= 2, "City must have at least 2 characters");
        require(bytes(province).length >= 2, "Province must have at least 2 characters");
        require(bytes(country).length >= 2, "Country must have at least 2 characters");

        barangayExtract = substring(barangay, 0, 2);
        cityExtract = substring(city, 0, 2);

        provinceExtract = substring(
            province,
            bytes(province).length - 2,
            bytes(province).length
        );

        countryExtract = substring(
            country,
            bytes(country).length - 2,
            bytes(country).length
        );

        combinedString = string(
            abi.encodePacked(
                barangayExtract,
                cityExtract,
                provinceExtract,
                countryExtract
            )
        );

        hashUsingAbiEncode = keccak256(
            abi.encode(combinedString)
        );

        hashUsingAbiEncodePacked = keccak256(
            abi.encodePacked(combinedString)
        );
    }

    function substring(
        string memory str,
        uint startIndex,
        uint endIndex
    ) internal pure returns (string memory) {

        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex - startIndex);

        for (uint i = startIndex; i < endIndex; i++) {
            result[i - startIndex] = strBytes[i];
        }

        return string(result);
    }
}