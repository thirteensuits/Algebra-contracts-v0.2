# Algebra Smart Contracts -- reimagining cash flow and realigning incentives for everyday consumer products

This is Version 0.2 of the Algebra Smart Contracts, meant to act as the optimal framework for how transactions for everyday consumer products should be executed on-chain.

Many thanks to the OpenZepellin team as well as to YouTube and its creators who enable the public to learn how to code for free.

## Available Scripts

We suggest using Virtual Studio Code.

The following commands will launch the app in your localhost:3000

### `npm install`
### `npm run start`

Our live demo can be checked out below:
https://themala.xyz

## Components and Config

The front-end makes use of React across a multi-page website. There are three main pages, each held in the components subfolder of the src folder, which also includes the Navigation.jsx for the navigation bar and Footer.jsx for the footer.

The three main pages are as follows:

 - Home.jsx -- this page contains a Demo of the protocol operating on the Rinkeby testnet where you can buy TheMala by minting from its SBT smart contract and then claiming a physical serving with loyalty tokens airdropped as a bonus.

 - Owner.jsx -- this page is for product owners, who can view and withdraw proceeds from TheMala sales in real-time.

There are several blockchain applications present throughout the website, and each make heavy use of React-Redux. Each application is stored as a .js file within the functions subfolder of the src folder, and has been exported as a function to the aforementioned pages in the components subfolder.

As denoted in the config.json, the applications on this website are meant to be operate on the Rinkeby testnet, as this is still a work in progress.

There are three smart contract addresses that can be configured in the config.json with their respective ABIs in the config subfolder located in the public folder:

 - BRANCH_SBT_ADDRESS -- this smart contract acts as the barcode for the product; products are purchased by minting SBTs from this contract.
   - corresponds to abi.json

 - TOKEN_ADDRESS -- this smart contract is engaged during the claim process and provides loyalty tokens to reward those who purchase the product while also ensuring that each minted SBT can only undergo the claim process once - i.e. one NFT can only claim one product.
   - corresponds to token_abi.json

 - PAYMENT_ADDRESS -- this smart contract acts as the paymaster, designating how much of the proceeds from the sale of the product is due to each product owner, and allowing each product owner to claim their share of the proceeds in real time; as such, this contract is executable only by the product owners.
   - corresponds to payment_abi.json

These functionalities are described in greater detail below. Additionally, we hope to integrate another smart contract soon:

 - OWNER_NFT_ADDRESS -- this smart contract designates product ownership - i.e. holders of OwnerNFTs are the product owners who have exclusive access to view and withdraw their share of the proceeds in real time.

## Purpose

Our purpose is to build the protocol which will allow transactions for physical products to be completely executed on the blockchain. This means that both the cryptocurrency used to purchase the product as well the product being purchased will be represented on the blockchain.

We define such transactions -- where both sides of the exchange are represented on the blockchain -- to be <b>full-chain transactions</b>.

Purchasing an NFT for ETH is an example of a full-chain transaction: when the two assets are exchanged, both sides of the transaction -- (i) the NFT to buyer and (ii) the ETH to seller -- are recorded on the blockchain: the entire transaction is represented, in full, on the blockchain.

<p align="center">
<img src="full-chain.jpg" width="50%">
</p>

Currently, there are many payment processors which allow crypocurrency to be used to purchase physical products. In these cases, the transfer of the cryptocurrency from the purchaser to the merchant (or payments provider) is recorded on the blockchain; however, there is no information on the blockchain regarding the product that was purchased.

We define these transactions where only half of the information is recorded on the blockchain to be <b>half-chain transactions</b>. Such transactions do not provide any information as to why the cryptocurrency was transferred from one account to another.

<p align="center">
<img src="halfchain.jpg" width="50%">
</p>

Half-chain transactions make no use of any of the functionalities offered by blockchain technology and have questionable value-add beyond treating cryptocurrency as a currency.

Moving transactions for physical products from half-chain to full-chain will allow for the functionalities of blockchain technology to be actualized, and will consequently provide meaningful benefits to merchants, consumers, investors, and the market as a whole.

These benefits are valuable enough to eventually push a tremendous amount of transactions for physical products to be executed on-chain.

## Home.jsx

Our home page stores the Demo where full-chain transactions for TheMala can be executed on the Rinkeby testnet.

We injectively represent TheMala with a unique SBT smart contract address. These 1-to-1 pairings are meant to mirror how barcodes are used to represent products in commerce today. Since there is no maximum limit to how many units of a given product can be sold, there is no maximum cap to the number of SBTs which can be minted from these addresses -- unless the product in question is meant to be a limited edition product.

<p align="center">
<img src="HIW0.jpg" width="50%">
</p>

Just as a barcode is scanned to initiate the purchase of a product, the purchasing journey under our protocol begins with the purchaser minting an SBT from the aforementioned SBT smart contract address. Both sides of this transaction are consequently recorded on the blockchain — (i) the cryptocurrency used to mint (or pay for) the SBT (or product), and (ii) the SBT (or representation of the product) transferred to the purchaser in exchange for the payment. This is a full-chain tranasction.

<p align="center">
<img src="HIW1.png" width="50%" class="center">
</p>

Upon completing the full-chain transaction, the purchaser will then want to claim the physical product. It is essential that each SBT that is minted can only claim one product. We accomplish this by having our claim process mimic a token airdrop exclusive to NFT holders -- for example, the ApeCoin airdrop for BAYC/MAYC holders -- which tracks the status of whether or not an NFT has already been used to claim tokens from an airdrop.

In addition to providing the physical address to receive the product, the purchaser must also provide the merchant with the index number of the SBT that was minted to complete the claim process. In order for this process to execute, the purchaser must be holding the SBT which corresponds to the index number that was provided. This exchange will ensure that the index number of each SBT that has completed a claim is been recorded on the blockchain.

<p align="center">
<img src="HIW2.png" width="50%" class="center">
</p>

If the same index number initiates a second claim, then the process will fail, ensuring that each minted SBT can only claim one product.

Since it mimics an airdrop, our claim function also provides an opportunity for merchants to reward its customers with loyalty tokens, sent to the purchaser at time of claim. The precise functionality of the loyalty token can be determined by the merchant, and having this option is a great way to encourage repeat purchases, word-of-mouth marketing, and build a community for a product.

<p align="center">
<img src="HIW3.png" width="50%" class="center">
</p>

## Owner.jsx

This is page is for the product owners to see the proceeds from the sale of the product, as well as to claim their share of the proceeds.

The proceeds from minting the SBTs are stored in the SBT's smart contract. These proceeds can be withdrawn to a payment smart contract by the product owners.

<p align="center">
<img src="HIW5.jpg" width="50%" class="center">
</p>

In the payment smart contract, the product owners can choose to divvy up the proceeds amongst themselves to their choosing. The implications of this transparency and functionality are easy to imagine, and are consequential to fundraising, investing, compensation, payment cycles, and other aspects of 'real' business.

<p align="center">
<img src="HIW6.jpg" width="50%" class="center">
</p>

Taken as a whole, these functionalities provide the capacity to illuminate not only the relationship between the purchaser and the merchant, but also that of the product operator and the product owner. The resulting value-adds will spur more efficient allocation of capital and push for the development of better products, providing a net positive for the market as a whole.

## Shortcomings and things that need to be built

At the theoretical level, the largest shortcoming comes with providing the physical address to receive the product. This constitutes an insta-dox, as a given wallet address can now be linked to a given physical address.

There are also issues regarding disputes -- for example, what happens in the event that the purchaser says the physical product has not yet arrived, but the merchant says the product was already sent two weeks ago? There are many examples of disputes; and payment processors act as third-parties to resolve said disputes, even going so far as to go into their own pockets to refund transactions.

Under our protocol, the purchaser and the merchant interact directly, and there is no third-party to hold the merchant accountable once the payment has been made. It is possible to set up a third party which handles logistics; effectively verfiying stock, checking on orders, and executing delivery. It would be capitally intensive to build this third party, and this prcoess could also be expensive for certain merchants who may not have the funds to provide the initial amount of invetory.

There is also the obvious issue of adoption. While many merchants tout that they are ready to accept cryptocurrency as payments, and many providers have been set up to execute these payments, it is clear that the volume of half-chain transactions is extremely small. Is there any actual demand, at this time, to use cryptocurrency to purchase physical products?

On the coding side, there is definitely some clunkiness, and we would like to add (or experiment with) certain features, including:
 - providing a section to check if the index number of an SBT has already been used to claim an order
 - automating the claim process such that there is no need for the purchaser to check and submit the index number of the SBT in the purchaser's wallet
 - saving the inputted physical address in a way that is not linked to the wallet address used to execute the claim
 - tokengating entry to the "Owner" section to OwnerNFT owners
 - conducting real-time checks for OwnerNFT ownership status in the process for viewing and withdrawing proceeds
