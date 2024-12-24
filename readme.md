# NFT Tic-Tac-Toe

## Overview
NFT Tic-Tac-Toe is an innovative blockchain-powered game that combines the timeless fun of Tic-Tac-Toe with the rewarding nature of NFTs. Each game outcome is recorded on the blockchain, ensuring transparency and immutability, while winners are rewarded with unique ERC-721 NFTs.

## Smart Contract Details
- **Contract Address:** `0xcb98a3b8dced5eacbc18ee43779b75c90eaa2df6`
- **Network:** [Specify the network, e.g., Ethereum Testnet or Polygon Mainnet]
- **Token Standard:** ERC-721

## Features
- **Seamless Gameplay:** Players can challenge each other to a classic 3x3 Tic-Tac-Toe game.
- **NFT Rewards:** Winners receive a unique NFT as proof of their victory.
- **On-chain State:** The state of each game (board and players) is managed entirely on-chain.
- **Fair Play Enforcement:** Moves and game results are verified by the smart contract, ensuring fairness.

## Vision
This project aims to merge the growing trend of blockchain gaming with accessible and engaging game mechanics. We envision a decentralized ecosystem where casual games like Tic-Tac-Toe provide:
- **Play-to-Earn Mechanism:** Incentivize players with tangible rewards like NFTs.
- **Global Competition:** Foster a global, decentralized gaming community.
- **Game Ownership:** Provide participants ownership of in-game assets.

## Future Scope
1. **Customizable NFTs:** Enhance NFTs with metadata that includes player stats, game history, and special in-game achievements.
2. **Marketplace Integration:** Allow players to trade their earned NFTs on platforms like OpenSea.
3. **Leaderboard System:** Introduce a ranking system to highlight top players globally.
4. **Multi-Game Support:** Expand beyond Tic-Tac-Toe to include other simple but addictive games.
5. **Advanced Graphics:** Develop a user-friendly front-end interface for an immersive gaming experience.
6. **DAO Governance:** Enable community-driven development decisions, such as new features or updates.

## Getting Started
1. **Deploy the Contract:** Deploy the provided Solidity contract on your preferred Ethereum-compatible blockchain.
2. **Interact with the Contract:** Use tools like Remix or a web3.js-powered front-end to call the following functions:
   - **`createGame(address opponent)`**: Initiate a new game.
   - **`playMove(uint256 gameId, uint8 position)`**: Play a move on the board.
3. **Claim NFTs:** NFTs are automatically awarded to the winner upon completion of the game.

## Development
### Prerequisites
- Solidity ^0.8.0
- Node.js (for future front-end integration)
- Hardhat/Truffle for development and testing

### Installation
1. Clone the repository.
2. Install dependencies with `npm install`.
3. Deploy the contract on your network of choice.

## Contributing
Contributions are welcome to improve gameplay, NFT designs, or overall functionality. Feel free to fork the repository and submit pull requests!

## License
This project is open-source and available under the MIT License.

---