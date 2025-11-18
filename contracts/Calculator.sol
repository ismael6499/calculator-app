//SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

contract Calculator{

    uint256 public result = 1;

    modifier checkMaxPowerNumber(uint256 num1_){
        if(num1_ > 10) revert();
        _;
    }

    modifier checkNotZero(int256 num1_){
        if (num1_ == 0) revert();
        _;
    }

    event Addition(uint256 num1, uint256 num2, uint256 result);
    event Substraction(int256 num1, int256 num2, int256 result);

    function add(uint256 num1_, uint256 num2_) public returns(uint256 result_) {
        result_ = num1_+num2_;
        emit Addition(num1_, num2_, result_);
    }

    function substract(int256 num1_, int256 num2_) public returns (int256 result_){
        result_ = substraction_logic(num1_, num2_);
        emit Substraction(num1_, num2_, result_);
    }

    function divide(int256 num1_, int256 num2_) public pure checkNotZero(num2_) returns (int256 result_){
        result_ = num1_ / num2_;
    }

    function multiply(uint256 num1_, uint256 num2_) public{
        result = num1_ * num2_;
    }

    function power(uint256 num1_) public checkMaxPowerNumber(num1_){
        result = result ** num1_;
    }
    
    function substraction_logic(int256 num1_, int256 num2_) pure  internal returns (int256 result_){
        return num1_ - num2_;
    }
}