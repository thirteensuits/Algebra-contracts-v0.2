# Algebra Smart Contracts
# reimagining the commerce of everyday products

This is Version 0.2 of the Algebra Smart Contracts, exploring new and more efficient ways to buy and sell everyday products by re-aligning incentives using blockchain technology.

Many thanks to OpenZepellin.

## Foreword

There are 4 smart contracts that make up the Algebra framework and are described as follows:

 - BranchSBT.sol --

This contract issues BranchSBTs, which are soul-bound tokens that represent the everyday consumer product being bought and sold. Why soul-bound? Because everyday consumer products are not traded or collected; they are bought to be used, and the soul-bound token acts as both the representation and the receipt for the everday consumer product.

 - $SBT.sol --

This contract issues ERC-20 tokens that act as loyalty points whenever a BranchSBT is claimed in return for the physical version of the representated product. The tokens can come with some degree of governance or can be used as a currency for limited edition products; the specifics of token utility are up to the merchant, and what the token provides is blockchain functionality to potentially tie the consumer closer to the merchant.

 - TrunkNFT.sol -- 

This contract issues TrunkNFTs which represent an ownership position in the everyday product being represented by the BranchSBTs. The ownership position can be attained by being involved in the operations or via investment; again, the specifics can be determined on a  case-by-case basis by the relevant parties. Instead of using ERC-20 tokens to mimic equity ownership, the Algebra framework uses NFTs to mimic something closer to a Board of Directors, where each holder has a certain degree of responsibility and can also more memetically display their ownership if they choose to do so. This does not preclude the possibility of also issuing ERC-20 tokens to represent onwership, or "governance" (can be the $SBT.sol token, for example)

 - Payment.sol -- this page is for product owners, who can view and withdraw proceeds from TheMala sales in real-time.
