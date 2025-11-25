// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

/// @title Basic Calculator
/// @author Agustin Acosta
/// @notice A simple calculator to perform arithmetic operations with mixed state strategies
contract Calculator {

    error DivisionByZero();
    error MaxPowerExceeded();

    uint256 public result = 1;

    event Addition(uint256 indexed num1, uint256 indexed num2, uint256 result);
    event Subtraction(int256 indexed num1, int256 indexed num2, int256 result);

    modifier checkMaxPowerNumber(uint256 _num1) {
        if (_num1 > 10) {
            revert MaxPowerExceeded();
        }
        _;
    }

    modifier checkNotZero(int256 _num1) {
        if (_num1 == 0) {
            revert DivisionByZero();
        }
        _;
    }

    function add(uint256 _num1, uint256 _num2) external returns (uint256 _result) {
        _result = _num1 + _num2;
        emit Addition(_num1, _num2, _result);
    }

    function subtract(int256 _num1, int256 _num2) external returns (int256 _result) {
        _result = _subtractionLogic(_num1, _num2);
        emit Subtraction(_num1, _num2, _result);
    }

    function divide(int256 _num1, int256 _num2) external pure checkNotZero(_num2) returns (int256 _result) {
        _result = _num1 / _num2;
    }

    function multiply(uint256 _num1, uint256 _num2) external {
        result = _num1 * _num2;
    }

    function power(uint256 _num1) external checkMaxPowerNumber(_num1) {
        result = result ** _num1;
    }
    
    function _subtractionLogic(int256 _num1, int256 _num2) internal pure returns (int256) {
        return _num1 - _num2;
    }
}