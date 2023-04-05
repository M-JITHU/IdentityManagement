//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract NFTMarketplace is ERC721URIStorage {

address payable owner;

using Counters for Counters.Counter;
Counters.Counter private _tokenIds;
Counters.Counter private _itemsSold;

uint listPrice = 0.01 ether;

constructor () ERC721("NFTMarketplace", "NFTM")
{
    owner =payable(msg.sender);
}

struct ListedToken{
    uint256 tokenId;
    address payable owner;
    address payable seller;
    uint256 price;
    bool currentlyListed;
}
mapping(uint256 => ListedToken) private idToListedToken;

function updateListPrice(uint256 _listPrice) public payable {
    require(owner == msg.sender,"only owner can update the listed price");
    listPrice = _listPrice;
}
function getListPrice() public view returns (uint256){

    return listPrice;
}



}