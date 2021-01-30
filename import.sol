pragma solidity ^0.5.0;


import "./gift.sol";

/**
 * The mortal is owned contract does this and that...
 */
contract mortal is owned {
  
  function kill() {
  	selfdestruct(owner);  	
  }
}

/**
 * The   contract does this and that...
 */
contract  user is owned , mortal {
  string public UserName;
  function User(string _name){
  	UserName = _name;
  }  
  
}

