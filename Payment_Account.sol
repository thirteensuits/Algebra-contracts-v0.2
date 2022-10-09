// SPDX-License-Identifier: AGPL-3.0-only

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
    number = nft.maxSupply();
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

    function withdrawable(address input) public view returns (uint256[] memory) {
        uint256[] memory set = TrunkNFT(nft).walletOfOwner(input);
        return set;
    }

    function withdrawing(address input) public view returns (uint256[] memory){
        uint256[] memory set = withdrawable(input);
        uint256[] memory bet = new uint256[](set.length);
        for (uint256 i = 0; i < set.length; i++) {
        bet[i] = releasable(set[i]);}
        return bet;
    }

    function totalwith(address input) public view returns (uint256){
        uint256[] memory bet = withdrawing(input);
        uint256 money = 0;
        for (uint256 i = 0; i < bet.length; i++) {
        money = money + bet[i];}
        return money;
    }

    function release(address payable input) public payable virtual {
    uint256[] memory set = withdrawable(input);
    uint256 payment = totalwith(input);
    require(payment != 0, "PaymentSplitter: account is not due payment");
        _totalReleased += payment;
        unchecked {
        for (uint256 i = 0; i < set.length; i++) {
            _released[set[i]] += payment/set.length;
        }
        }
        Address.sendValue(input, payment);
        emit PaymentReleased(input, payment);
    }
    
    function _pendingPayment(
    uint256 totalReceived,
    uint256 alreadyReleased
    ) private view returns (uint256) {
        return totalReceived / number - alreadyReleased;
        }

   
}
