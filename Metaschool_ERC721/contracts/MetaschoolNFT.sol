//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
import './ERC721URIStorage.sol';

contract MetaschoolNFT is ERC721URIStorage{
    //the metadata in json format is hosted in the below ipfs url
    string _hostedMetadataURI = "ipfs://QmbSwvp49TX24THb5Nt3fjoVd8dB7fMMXJPgCG4p1WtWaZ";
    uint256 tokenCounter;
    address admin;
    constructor(string memory _name, string memory _symbol)ERC721(_name, _symbol){
        tokenCounter =0;
        admin = msg.sender;

    }


    modifier _onlyAdmin(){
        require(msg.sender == admin);
        _;
    }

    function changeAdmin(address _newAdmin) public _onlyAdmin {
        admin = _newAdmin;
    }

// call this function with the recipient address to mint and airdrop
    function mintForAirdrop(address _recipient) _onlyAdmin public returns (uint256){
        uint256 newNftId = tokenCounter;
        _safeMint(_recipient, newNftId);
        _setTokenURI(newNftId,_hostedMetadataURI);
        tokenCounter++;
        return newNftId;
    }




}