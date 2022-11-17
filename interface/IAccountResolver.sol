// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

interface IAccountResolver {
    event NameChanged(bytes32 indexed node, string name);
    event AvatarChanged(bytes32 indexed node, address nftAddress, uint256 tokenId);

    /**
     * Returns the name associated with an ENS node, for reverse records.
     * Defined in EIP181.
     * @param node The ENS node to query.
     * @return The associated name.
     */
    function name(bytes32 node) external view returns (string memory);
    function avatar(bytes32 node) external view returns (address nftAddress, uint256 tokenId);
}
