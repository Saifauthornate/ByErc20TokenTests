//SPDX-License-Identifier: No-License
pragma solidity 0.8.0;
    
import "./ITestToken.sol";
contract Presale {

    uint256 public price = 1 ether;
    IERC20 public Token;
    constructor (IERC20 _add){
        Token= _add;
    }

    function buyErcToken( )  payable public    {

          require(msg.value==price,"Invalid Price");
         payable (Token._owner()).transfer(price);
        
    
        Token.transferFrom(Token._owner(),msg.sender,10*10**18);

    }
    

}