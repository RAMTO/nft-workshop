// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC1155/ERC1155.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol';

contract CryptoRevolution is ERC1155, Ownable, ERC1155Supply {
  enum NFT_Types {
    VISITOR,
    VIP,
    LECTURER_01,
    LECTURER_02,
    LECTURER_03,
    LECTURER_04,
    LECTURER_05,
    LECTURER_06,
    LECTURER_07,
    LECTURER_08
  }

  constructor()
    ERC1155(
      'https://gateway.pinata.cloud/ipfs/QmYWjgERZxTsQaERz9aYTBQeS2FgTdAvnZMzV58FnkGrcs/{id}.json'
    )
  {}

  function mint(address account, uint256 id) public onlyOwner {
    require(
      (id >= uint256(NFT_Types.VISITOR) && id <= uint256(NFT_Types.LECTURER_08)),
      'Mint token level is incorrect'
    );
    _mint(account, id, 1, '');
  }

  function mintBatch(
    address to,
    uint256[] memory ids,
    uint256[] memory amounts,
    bytes memory data
  ) public onlyOwner {
    _mintBatch(to, ids, amounts, data);
  }

  // The following functions are overrides required by Solidity.

  function _beforeTokenTransfer(
    address operator,
    address from,
    address to,
    uint256[] memory ids,
    uint256[] memory amounts,
    bytes memory data
  ) internal override(ERC1155, ERC1155Supply) {
    super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
  }
}
