// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "./ResolverBase.sol";
import "./IAccountResolver.sol";

contract AccountResolver is IAccountResolver, ResolverBase {
    mapping(uint64 => mapping(bytes32 => string)) versionable_names;
    mapping(uint64 => mapping(bytes32 => address)) versionable_nfts;
    mapping(uint64 => mapping(bytes32 => uint256)) versionable_tokenids;

    address trustedController;

    constructor(
        address _trustedController
    ) {
        trustedController = _trustedController;
    }

    /**
     * Sets the name associated with an ENS node, for reverse records.
     * May only be called by the owner of that node in the ENS registry.
     * @param node The node to update.
     */
    function setName(bytes32 node, string calldata newName)
        external
        virtual
        authorised(node)
    {
        versionable_names[recordVersions[node]][node] = newName;
        emit NameChanged(node, newName);
    }

    function setAvatar(bytes32 node, address nftAddress, uint256 tokenId)
        external
        virtual
        authorised(node)
    {
        versionable_nfts[recordVersions[node]][node] = nftAddress;
        versionable_tokenids[recordVersions[node]][node] = tokenId;
        emit AvatarChanged(node, nftAddress, tokenId);
    }


    /**
     * Returns the name associated with an ENS node, for reverse records.
     * Defined in EIP181.
     * @param node The ENS node to query.
     * @return The associated name.
     */
    function name(bytes32 node)
        external
        view
        virtual
        override
        returns (string memory)
    {
        return versionable_names[recordVersions[node]][node];
    }

    function avatar(bytes32 node)
        external
        view
        virtual
        override
        returns (address nftAddress, uint256 tokenId)
    {
        return (
            versionable_nfts[recordVersions[node]][node],
            versionable_tokenids[recordVersions[node]][node]
        );
    }

    function isAuthorised(bytes32 node) internal view override returns (bool) {
        if (
            msg.sender == trustedController
        ) {
            return true;
        }
        return false;
    }

    function supportsInterface(bytes4 interfaceID)
        public
        view
        virtual
        override
        returns (bool)
    {
        return
            interfaceID == type(IAccountResolver).interfaceId ||
            super.supportsInterface(interfaceID);
    }
}
