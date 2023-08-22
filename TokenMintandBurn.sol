// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CustomToken {
    string public tokenName;
    string public tokenAbbrv;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _abbrv, uint256 _initialSupply) {
        tokenName = _name;
        tokenAbbrv = _abbrv;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function mint(address _account, uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        totalSupply += _amount;
        balances[_account] += _amount;
    }

    function burn(address _account, uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        require(balances[_account] >= _amount, "Insufficient balance");

        totalSupply -= _amount;
        balances[_account] -= _amount;
    }
}
