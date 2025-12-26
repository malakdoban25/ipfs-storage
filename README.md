# IPFS Storage DApp

A decentralized application for storing IPFS file hashes on the Ethereum blockchain with HD Wallet integration.

## Features

- ✅ Store IPFS hashes on blockchain
- ✅ Retrieve stored hashes
- ✅ Store multiple files with identifiers
- ✅ HD Wallet integration for secure key management
- ✅ Event logging for all transactions

## Technologies Used

- Solidity 0.8.19
- Truffle Suite
- Ganache (Local Blockchain)
- IPFS Desktop
- HD Wallet Provider
- Node.js

## Project Structure

ipfs-storage/
├── contracts/          # Smart contract (IPFSStorage.sol)
├── migrations/         # Deployment scripts
├── build/              # Compiled contracts (auto-generated)
├── node_modules/       # Dependencies (auto-generated)
├── scripts/            # Custom scripts (optional)
├── test/               # Test files (optional)
├── .env                # Environment variables (not in repo)
├── .gitignore          # Files to ignore in git
├── truffle-config.js   # Network configuration
├── package.json        # Project dependencies
└── README.md           # This file

## Setup Instructions

### 1. Clone the Repository

git clone https://github.com/YOUR_USERNAME/ipfs-storage-dapp.git
cd ipfs-storage-dapp

### 2. Install Dependencies

npm install

### 3. Create .env File

Create a .env file in the project root with:

MNEMONIC="your twelve word mnemonic phrase here"

GANACHE_URL=http://127.0.0.1:7545

**Important:** The mnemonic must match your Ganache mnemonic!

### 4. Start Ganache

Open Ganache Desktop App and ensure:
- RPC Server: HTTP://127.0.0.1:7545
- Network ID: 5777
- Mnemonic matches your .env file

### 5. Deploy Contract

npx truffle migrate --network development --reset

### 6. Interact with Contract

npx truffle console --network development

Then in the console try:

let contract = await IPFSStorage.deployed()

await contract.setHash("YOUR_IPFS_HASH")

await contract.getHash()


## Smart Contract Functions

| Function | Type | Description |
|----------|------|-------------|
| setHash(string) | Write | Store a single IPFS hash |
| getHash() | Read | Retrieve the stored hash |
| setFileHash(string, string) | Write | Store hash with file identifier |
| getFileHash(string) | Read | Get hash by file identifier |
| getFileCount() | Read | Get number of stored files |
| getAllFileIds() | Read | Get all file identifiers |
| owner() | Read | Get contract owner address |

## Usage Examples

### Store a Single Hash

await contract.setHash("QmbCWUCRaUAQ1niKza2AxzXFDXFUwks7EtyoChsfU31Q3C")

### Retrieve the Hash

let hash = await contract.getHash()

console.log(hash)

### Store Multiple Files

await contract.setFileHash("my-photo", "QmPhotoHash123")

await contract.setFileHash("my-document", "QmDocumentHash456")

await contract.setFileHash("my-video", "QmVideoHash789")


### Get File by ID

await contract.getFileHash("my-photo")

### Count Files

let count = await contract.getFileCount()

console.log(count.toString())

### List All Files

await contract.getAllFileIds()

## HD Wallet Integration

This project uses @truffle/hdwallet-provider for secure key management:

- Generates multiple accounts from a single 12-word mnemonic
- Automatically signs transactions
- Industry standard (BIP39/BIP44)
- Same mnemonic always generates the same accounts

## IPFS Integration

1. Upload file to IPFS using IPFS Desktop
2. Copy the CID (Content Identifier)
3. Store CID on blockchain using the smart contract
4. File is accessible at: https://ipfs.io/ipfs/YOUR_CID

## Restarting the Project

When you close and reopen everything:

1. Open Ganache App
2. Run: npx truffle migrate --network development --reset
3. Run: npx truffle console --network development
4. Interact with your contract

**Note:** Ganache blockchain resets when closed. You need to redeploy and store hashes again.

## Security Notes

- Never share your mnemonic phrase
- Never commit .env file to GitHub
- The .gitignore file excludes sensitive files

## License

MIT
