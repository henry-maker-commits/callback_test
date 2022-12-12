
pragma solidity ^0.8.0;

interface IFdSbt003{
	function mint(address account, uint256 amount) external;
	function burn(address account, uint256 amount) external;
}

contract callback{
	address public sbt;
	function setFDAddress(address _sbt) public {
		sbt = _sbt;
	}

	function mintExternal(address _account, uint256 _amount) public {
		IFdSbt003(sbt).mint( _account,  _amount);
	}
	function burnExternal(address _account, uint256 _amount) public {
		IFdSbt003(sbt).burn( _account,  _amount);
	}
}

