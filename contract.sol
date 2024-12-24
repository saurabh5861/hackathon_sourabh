// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTTicTacToe is ERC721, ReentrancyGuard, Ownable {
    struct Game {
        address player1;
        address player2;
        uint256 player1TokenId;
        uint256 player2TokenId;
        uint8[9] board;  // 0: empty, 1: player1, 2: player2
        bool isActive;
        address currentTurn;
        address winner;
    }
    
    mapping(uint256 => Game) public games;
    uint256 public gameCounter;
    uint256 public tokenCounter;
    
    event GameCreated(uint256 gameId, address player1, uint256 tokenId);
    event GameJoined(uint256 gameId, address player2, uint256 tokenId);
    event MoveMade(uint256 gameId, address player, uint8 position);
    event GameWon(uint256 gameId, address winner);
    event GameDrawn(uint256 gameId);
    
    constructor(address initialOwner) 
        ERC721("TicTacToe NFT", "TTT") 
        Ownable(initialOwner) 
    {
        // No additional initialization needed
    }
    
    function mintNFT() external returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        tokenCounter++;
        return newTokenId;
    }
    
    function createGame(uint256 _tokenId) external nonReentrant {
        require(ownerOf(_tokenId) == msg.sender, "You must own the NFT");
        require(getApproved(_tokenId) == address(this) || isApprovedForAll(msg.sender, address(this)), 
                "Contract must be approved to transfer NFT");
        
        uint256 gameId = gameCounter++;
        games[gameId].player1 = msg.sender;
        games[gameId].player1TokenId = _tokenId;
        games[gameId].isActive = true;
        games[gameId].currentTurn = msg.sender;
        
        // Transfer NFT to contract
        _transfer(msg.sender, address(this), _tokenId);
        
        emit GameCreated(gameId, msg.sender, _tokenId);
    }
    
    function joinGame(uint256 _gameId, uint256 _tokenId) external nonReentrant {
        Game storage game = games[_gameId];
        require(game.isActive, "Game does not exist or is not active");
        require(game.player2 == address(0), "Game is full");
        require(msg.sender != game.player1, "Cannot play against yourself");
        require(ownerOf(_tokenId) == msg.sender, "You must own the NFT");
        require(getApproved(_tokenId) == address(this) || isApprovedForAll(msg.sender, address(this)), 
                "Contract must be approved to transfer NFT");
        
        game.player2 = msg.sender;
        game.player2TokenId = _tokenId;
        
        // Transfer NFT to contract
        _transfer(msg.sender, address(this), _tokenId);
        
        emit GameJoined(_gameId, msg.sender, _tokenId);
    }
}