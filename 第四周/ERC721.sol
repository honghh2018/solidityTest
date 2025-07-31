//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


//NFT

interface IERC165{
   function supportsInterface(bytes4 interfaceID) external view returns (bool);
    
}


interface IERC721{
    function balanceOf(address owner) external view  returns (uint256 balance );
    function ownerOf(uint256 tokenId) external view returns(address owner);
    function safeTransferFrom(address from,address to,uint256 tokenId) external ;
    function safeTransferFrom(address from,address to,uint256 tokenId,bytes calldata data) external ;
    function transferFrom(address from,address to,uint256 tokenId) external ;
    function approve(address to,uint256 tokenId) external ;
    function getApproved(uint256 tokenId) external view returns(address operator);
    function setApprovalForAll(address operator,bool _approvd) external ;
    function isApprovedForAll(address owner,address operator) external view returns(bool);
}

interface IERC721Reciver{
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    )external returns (bytes4);
}


contract ERC721 is IERC721 {
   //合约实现
   event Transfer(address indexed from,address indexed  to,uint256 indexed id);
   event Approval(address indexed owner,address indexed spender,uint256 indexed id);
   event ApprovalForAll(address indexed owner,address indexed operator,bool approved);
  //实现的状态变量

  mapping (uint =>address) internal _ownerOf;
  mapping (address=>uint) internal _balanceOf;
  mapping (uint=>address) internal _approvals;
  mapping (address=>mapping (address=>bool)) public isApprovedForAll;
  
  //开始实现函数
   function balanceOf(address owner) external view  returns (uint256 balance ){
    //固定写法
      return interfaceID ==type(IERC721).interfaceId || interfaceID==type(IERC165).interfaceId;
   }

}