// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

import "https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC20.sol";
import "https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC721.sol";

contract CurrencyToken is ERC20 {
    ERC721 internal immutable nft;
    uint256 public immutable tokensPerClaim;
    uint256 public claimAmount = 0;

    mapping(address => uint256) public hasClaimed;

    constructor(
        ERC721 _nft,
        uint256 _tokensPerClaim,
        string memory name,
        string memory symbol
    ) ERC20(name, symbol, 18) {
        nft = _nft;
        tokensPerClaim = _tokensPerClaim; 
    }

function claim() external payable {
    require(ERC721(nft).balanceOf(msg.sender) > hasClaimed[msg.sender]);
    hasClaimed[msg.sender] += 1;

    _mint(msg.sender, tokensPerClaim);

}

}
