pragma solidity >= 0.7.0 <0.9.0;

contract pallgreeContract{

	mapping ( address  => uint) public balances;
	mapping ( address => mapping(address=>uint)) public allowance;
	  
	uint public totalSupply =1000 * 10 ** 9;
	string public name = "pallgree token";
	string public symbol= "PGR";
	uint public decimal =9;

	event Transfer(address indexed from,address indexed to,uint value);
	event Approval(address indexed owner,address indexed spender,uint value);

	constructor(){
		balances[msg.sender] =totalSupply;

	}

	function balanceOf(address owner) public view returns(uint){
		return balances[owner];
	}

	function transfer(address to,uint value) public returns(bool) {
		require(balances[msg.sender] >= value, "not enought token");
		balances[to] +=value;
		balances[msg.sender] -=value;
		emit Transfer(msg.sender,to,value);
		return true;

	}

	function transferFrom(address from,address to,uint value) public returns(bool){
		require(balancesOf(from) >= value ,"not enought token");
		require (allowance[from][msg.sender] >= value , "not enought token");
		balances[to] +=value;
		balances[from] -=value;

		emit Transfer(from,to ,value);

	}

	function approve(address spender ,uint value) public returns(bool){
		allowance[msg.sender][spender] =value;

		emit Approval(msg.sender,spender,value);
		return true;

	} 




}