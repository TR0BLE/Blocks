pragma solidity ^0.5.0;


/**
 * The contractName contract does this and that...
 */
contract ERC20 {
  // initialize the minter, sender and total coins in the beginning, can be zero and null
  address public minter;
  address public sender;
  uint public totalCoins;

// events created to track the coins

  event LogCoinsMinted(address delieverdTo, uint amount);
  event LogCoinsSent(address sentTo, uint amount);

  mapping (address => uint) balances;				// used address as a key to store uint balances in the balances array

  function ERC20 (uint initialCoins) {				// used to initialize the basic variables
  	minter = msg.sender;
  	totalCoins = initialCoins;
  	balances[minter] = initialCoins;
  	
  }

  function mint(address owner, uint amount){		// can be run by owner only and used to update the minted coins in the owner balance.
  	
  	if(msg.sender != owner) return;
  	balances[owner] = balances[owner] + amount;
  	totalCoins = totalCoins + amount;
  	LogCoinsMinted(owner, amount);
  }
  
  function send( address receiver, uint amount) {	// used to send the coins to any address
  	if(balances[sender] < amount) return;
  	balances[sender] -= amount;
  	balances[receiver] += amount;
   	LogCoinsSent(receiver, amount);
   }
   
   function queryBalance(address addr) returns(uint balance) {		// checks the balance available in any address in the given chain

   	return balance[addr];  	
   }

   function receive() returns(address addr) {       // used to display the owner address
    return msg.sender;

   }
   

   
   function killCoin() returns(bool status){			// can be used to kill the contract and can be executed only from main account
   	if(msg.sender != minter) return;
   	selfdestruct(minter);
   	
   }
   
}

