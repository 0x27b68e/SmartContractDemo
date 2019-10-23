pragma solidity ^0.5.11;

contract ERC20Token {
    string public name;
    mapping(address => uint256) balances;
    
    function mint() public {
        balances[msg.sender] ++;
    }
}


contract MyTokens{
    
    mapping(address => uint256) public balances;
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    event logBuyTokens(address indexed, uint256);
    
    function() external payable {
        buyTokens();
    }
    
    function buyTokens() public payable{ // this function will accept eth with payable keyword
     // how to call other contract in
     // need address of other contract when it was deployed, then we can call mint() function
        wallet.transfer(msg.value);
        emit logBuyTokens(msg.sender, 1);
    }
    
}