## Inspiration
The inspiration for this project came from CCIP and the presentation of Avalanche’s Teleporter. I thought about using both to give access to all the CCIP tokens and chains to all the Avalanche’s subnets.The idea is to allow seamless bridging without multiplying the points of trust.

I feel that both solutions are significantly trust-minimizing in their own setup, so merging them doesn’t multiply the risks a lot, and avoid relying on other solutions that might have different trust setups like the different layer zero and other bridges setup such as synapse.

## What it does
CCTP, or Cross-Chain Teleporter Protocol: The baby child of CCIP and Avalanche's Teleporter, merge the abilities of CCIP (Cross-Chain Interoperability Protocol) and Teleporter, to offer subnets access to a large variety of chains.
The current version is far from complete, due to time constraints. It mainly goes one way (Sepolia -> Dispatch through Fuji). But the implementation of the way opposite and of other subnets and chains is made easy, and even more with a bit more work on it.
It uses the teleporter on the subnet side, to connect to the C-Chain that has access to CCIP, and then CCIP to to connect to the different evm currently available:

## How we built it
To achieve this, I created several smart-contracts while trying to make them easier to operate in a broader case for all subnets, tokens, and chains.



## Challenges we ran into
Time: We didn't have enough time to develop, especially for the frontend as I hacked solo and it was a new skill to learn for me.

difficulty to map the different interactions to make. I also started using the wallet Core and stuck with it, but had a few issues where networks such as Sepolia disappeared from the interface, so had to add them back.A lot more could be done security-wis, but I took too much time in the beginning around it, and almost didn’t have time to implement a first functional version.

## Accomplishments that we're proud of
I am proud of the fact I was able to implement a first version, knowing that a more complete version wouldn’t need a lot more work to be functional. A lot could be done security-wise tho, but I already find cool the idea of only going through CCIP and Teleporter, and yet allowing access to a wide ecosystem to both the subnets that couldn’t access CCIP, and to the CCIP chains that couldn’t access the numerous subnets of Avalanche.

## What we learned
I learned to focus more on having something functional quickly (for the hackathons), and then iterate on it. Also that I should really learn frontend.I learned a lot about how Teleporter works, and also CCIP. I discovered Teleporter this week, while I had a bit of basic knowledge around CCIP (and Chainlink), but never tried to understand it and play with it.It was great !

## What's next for Feedata
- Fully implement both ways (CCIP-linked chains to Subnets, and Subnets to CCIP-linked chains)
- Generalize the contracts to allow easy implementations for each subnets / chains and the addition of tokens
- Try to automate the addition of tokens, or at least have a common registry on the C-Chain.
- Create a nice Front-end as an APP
- Create a frontend as a dev-tool allowing easy deployments in more custom ways

## Built With
- solidity
- Avalanche
- Chainlink
- Remix
- Hardhat
- typescript

## Try it out

































































































































# 🏗 Scaffold-ETH 2

<h4 align="center">
  <a href="https://docs.scaffoldeth.io">Documentation</a> |
  <a href="https://scaffoldeth.io">Website</a>
</h4>

🧪 An open-source, up-to-date toolkit for building decentralized applications (dapps) on the Ethereum blockchain. It's designed to make it easier for developers to create and deploy smart contracts and build user interfaces that interact with those contracts.

⚙️ Built using NextJS, RainbowKit, Hardhat, Wagmi, Viem, and Typescript.

- ✅ **Contract Hot Reload**: Your frontend auto-adapts to your smart contract as you edit it.
- 🪝 **[Custom hooks](https://docs.scaffoldeth.io/hooks/)**: Collection of React hooks wrapper around [wagmi](https://wagmi.sh/) to simplify interactions with smart contracts with typescript autocompletion.
- 🧱 [**Components**](https://docs.scaffoldeth.io/components/): Collection of common web3 components to quickly build your frontend.
- 🔥 **Burner Wallet & Local Faucet**: Quickly test your application with a burner wallet and local faucet.
- 🔐 **Integration with Wallet Providers**: Connect to different wallet providers and interact with the Ethereum network.

![Debug Contracts tab](https://github.com/scaffold-eth/scaffold-eth-2/assets/55535804/b237af0c-5027-4849-a5c1-2e31495cccb1)

## Requirements

Before you begin, you need to install the following tools:

- [Node (>= v18.17)](https://nodejs.org/en/download/)
- Yarn ([v1](https://classic.yarnpkg.com/en/docs/install/) or [v2+](https://yarnpkg.com/getting-started/install))
- [Git](https://git-scm.com/downloads)

## Quickstart

To get started with Scaffold-ETH 2, follow the steps below:

1. Clone this repo & install dependencies

```
git clone https://github.com/scaffold-eth/scaffold-eth-2.git
cd scaffold-eth-2
yarn install
```

2. Run a local network in the first terminal:

```
yarn chain
```

This command starts a local Ethereum network using Hardhat. The network runs on your local machine and can be used for testing and development. You can customize the network configuration in `hardhat.config.ts`.

3. On a second terminal, deploy the test contract:

```
yarn deploy
```

This command deploys a test smart contract to the local network. The contract is located in `packages/hardhat/contracts` and can be modified to suit your needs. The `yarn deploy` command uses the deploy script located in `packages/hardhat/deploy` to deploy the contract to the network. You can also customize the deploy script.

4. On a third terminal, start your NextJS app:

```
yarn start
```

Visit your app on: `http://localhost:3000`. You can interact with your smart contract using the `Debug Contracts` page. You can tweak the app config in `packages/nextjs/scaffold.config.ts`.

Run smart contract test with `yarn hardhat:test`

- Edit your smart contract `YourContract.sol` in `packages/hardhat/contracts`
- Edit your frontend in `packages/nextjs/pages`
- Edit your deployment scripts in `packages/hardhat/deploy`

## Documentation

Visit our [docs](https://docs.scaffoldeth.io) to learn how to start building with Scaffold-ETH 2.

To know more about its features, check out our [website](https://scaffoldeth.io).

## Contributing to Scaffold-ETH 2

We welcome contributions to Scaffold-ETH 2!

Please see [CONTRIBUTING.MD](https://github.com/scaffold-eth/scaffold-eth-2/blob/main/CONTRIBUTING.md) for more information and guidelines for contributing to Scaffold-ETH 2.
