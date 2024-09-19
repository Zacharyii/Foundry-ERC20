//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {
    mapping (address => uint256) private s_balances;

    // 令牌的名称
    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    // 令牌的符号
    function symbol() public pure returns (string memory) {
        return "REX";
    }

    // 返回令牌使用的小数位数，将令牌金额除以这么多个0来表示
    function decimals() public pure returns (uint8){
        return 18;
    }

    // 令牌供应总量
    function totalSupply() public pure returns (uint256){
        return 100 ether;
    }

    // 帐户余额
    function balanceOf(address _owner) public view returns (uint256 balance){
        return s_balances[_owner];
    }

    // 从当前合约地址转账到目标地址
    function transfer(address _to, uint256 _amount) public{
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to)  == previousBalances);
    }
}
