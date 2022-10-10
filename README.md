# Algebra Smart Contracts -- reimagining the commerce of everyday products

This is Version 0.2 of the Algebra Smart Contracts, exploring new and more efficient ways to buy and sell everyday products by re-aligning incentives using blockchain technology.

Many thanks to OpenZepellin.

## Foreword

First and foremost, it is the consumer and their act of consuming which legitimizes any given item’s status as a “product”. As such, we structure incentives for the consumer, not only to buy, but more importantly to also buy again; and even more valuable, to promote the product. We do this by issuing utility or governance tokens to the consumer for every purchase they make in order to give them some “skin in the game”.

Next, by providing on-chain representations of products, we enable transactions for products to be executed on-chain and bring trustless transparency to transaction data and therefore to sales performance. In an environment where sales performance is transparent and open, merchants are incentivized to build products that the market actually wants rather than to build narratives that sound good to VCs. The market experienced this with the slew of consumer brands IPOs in the past three years, when the actual sales performance for many of the brands with the hottest narratives finally became public, and the reveal of their dismal performance consequently led to tens of billions of dollars in investor value being completely wiped out.

It turns out that the capital market is more interested in actual sales performance than in narratives; and it turns out the consumer market was not actually interested in the products created under supposedly popular narratives. Total catastrophe, with tens of billions of dollars and tens of millions of labor hours misallocated and wasted.

It is in the interest of the investor to invest into products that the market actually wants. It is in the interest of the merchant to have the capital necessary to build the best products possible. It is in the interest of the market to have the best products possible. These interests are aligned when we bring transparency to sales performance. We see this in action with publicly listed companies and with blockchain adoption we can bring this dynamic to early stage consumer companies too.

Although there may be some perception that such a transparent environment is too tough for many merchants, if transparent sales performance can lead to decentralized fundraising, then merchants confident in the products they bring to the market are incentivized to participate. This is, after all, how publicly traded companies operate.

The ultimate goal is to use blockchain technology to align incentives under a framework which makes the buying and selling of consumer goods as efficient as possible; to bring the best possible products to the market; to avoid misallocation of capital; and to maximize the potential contribution of the consumer.

There are four smart contracts in the Algebra framework and they are described as follows:

## BranchSBT.sol – representing the product on the blockchain




 - BranchSBT.sol --

This contract issues BranchSBTs, which are soul-bound tokens that represent the everyday consumer product being bought and sold. Why soul-bound? Because everyday consumer products are not traded or collected; they are bought to be used, and the soul-bound token acts as both the representation and the receipt for the everday consumer product.

 - $SBT.sol --

This contract issues ERC-20 tokens that act as loyalty points whenever a BranchSBT is claimed in return for the physical version of the representated product. The tokens can come with some degree of governance or can be used as a currency for limited edition products; the specifics of token utility are up to the merchant, and what the token provides is blockchain functionality to potentially tie the consumer closer to the merchant.

 - TrunkNFT.sol -- 

This contract issues TrunkNFTs which represent an ownership position in the everyday product being represented by the BranchSBTs. The ownership position can be attained by being involved in the operations or via investment; again, the specifics can be determined on a  case-by-case basis by the relevant parties. Instead of using ERC-20 tokens to mimic equity ownership, the Algebra framework uses NFTs to mimic something closer to a Board of Directors, where each holder has a certain degree of responsibility and can also more memetically display their ownership if they choose to do so. This does not preclude the possibility of also issuing ERC-20 tokens to represent onwership, or "governance" (can be the $SBT.sol token, for example)

 - Payment.sol -- this page is for product owners, who can view and withdraw proceeds from TheMala sales in real-time.
