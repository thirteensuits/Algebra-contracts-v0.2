// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/utils/SafeERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Context.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "https://github.com/thirteensuits/Algebra-contracts-v0.2/blob/main/TrunkNFT.sol";

contract PaymentSplitter is Context {
    event PaymentReleased(address to, uint256 amount);
    event PaymentReceived(address from, uint256 amount);
    TrunkNFT internal nft;
    uint256 private _totalReleased;
    uint256 public number;
    mapping(uint256 => uint256) private _released;
    address payable account;
    
    constructor(TrunkNFT _nft) payable {
    nft = _nft;
    account = payable(msg.sender);
    number = nft.maxMintAmount();
    }
    
    receive() external payable virtual {
    emit PaymentReceived(_msgSender(), msg.value);
    }

    function totalReleased() public view returns (uint256) {
    return _totalReleased;
    }

    function released(uint256 tokenId) public view returns (uint256) {
    return _released[tokenId];
    }

    function payee(uint256 tokenId) public view returns (address) {
    return ERC721(nft).ownerOf(tokenId);
    }

    function releasable(uint256 tokenId) public view returns (uint256) {
    uint256 totalReceived = address(this).balance + totalReleased();
    return _pendingPayment(totalReceived, released(tokenId));
    }

    function release(uint256 tokenId) public payable virtual {
    require(msg.sender == payee(tokenId), "sup");
    uint256 payment = releasable(tokenId);
    require(payment != 0, "PaymentSplitter: account is not due payment");
        _totalReleased += payment;
        unchecked {
            _released[tokenId] += payment;
        }
        Address.sendValue(account, payment);
        emit PaymentReleased(account, payment);
        }
        
    function _pendingPayment(
    uint256 totalReceived,
    uint256 alreadyReleased
    ) private view returns (uint256) {
        return totalReceived / number - alreadyReleased;
        }

}
