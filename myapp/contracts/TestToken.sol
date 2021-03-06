// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Token1 is ERC20 , Ownable{


string public _TokenName;
string public _Symbol;
 

    constructor(string memory TokenName_, string memory Symbol_) ERC20(  TokenName_,   Symbol_){
    _TokenName=TokenName_;
    _Symbol=Symbol_;
     
    }

    function _minting(uint256 initialSupply) public  {
         _mint(msg.sender, initialSupply);
    }
    function _owner() public view returns (address){
         return owner();
    }

}

