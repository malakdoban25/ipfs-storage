// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IPFSStorage {
    string private ipfsHash;
    address public owner;
    event HashStored(address indexed sender, string ipfsHash, uint256 timestamp);
    mapping(string => string) private fileHashes;
    string[] private fileIds;

    constructor() {
        owner = msg.sender;
    }

    function setHash(string memory _ipfsHash) public {
        require(bytes(_ipfsHash).length > 0, "Hash cannot be empty");
        ipfsHash = _ipfsHash;
        emit HashStored(msg.sender, _ipfsHash, block.timestamp);
    }

    function getHash() public view returns (string memory) {
        return ipfsHash;
    }

    function setFileHash(string memory _fileId, string memory _ipfsHash) public {
        require(bytes(_fileId).length > 0, "File ID cannot be empty");
        require(bytes(_ipfsHash).length > 0, "Hash cannot be empty");
        
        if (bytes(fileHashes[_fileId]).length == 0) {
            fileIds.push(_fileId);
        }
        
        fileHashes[_fileId] = _ipfsHash;
        emit HashStored(msg.sender, _ipfsHash, block.timestamp);
    }

    function getFileHash(string memory _fileId) public view returns (string memory) {
        return fileHashes[_fileId];
    }

    function getFileCount() public view returns (uint256) {
        return fileIds.length;
    }

    function getAllFileIds() public view returns (string[] memory) {
        return fileIds;
    }
}