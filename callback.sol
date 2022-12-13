
pragma solidity ^0.8.0;

interface IFdSbt003{
	function mint(address account, uint256 amount) external;
	function burn(address account, uint256 amount) external;
}

contract callback{
	address public sbt;
	mapping(address => address) public userTosoul;
	function setFDAddress(address _sbt) public {
		sbt = _sbt;
	}


	constructor() {}
	

	function create(address _user) public {
		address _soul = address(new Soul(_user, address(this)));
		userTosoul[msg.sender] = _soul;
	}
	function mintExternal(address _account, uint256 _amount) public {
		IFdSbt003(sbt).mint( userTosoul[_account],  _amount);
	}
	function burnExternal(address _account, uint256 _amount) public {
		IFdSbt003(sbt).burn( userTosoul[_account],  _amount);
	}
}
contract Soul {
	address public owner;
	address public create;
	address[] public sbt;
	
	constructor(address _owner, address _create) {
		owner = _owner;
		create = _create;
	}
	modifier onlyOwner {
		require(msg.sender == owner);
		_;
	}
	modifier onlyCreate{
		require(msg.sender == create);
		_;
	}
}
