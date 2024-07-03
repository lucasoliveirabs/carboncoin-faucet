// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CarbonCoinFaucet is ERC20 {

    constructor() ERC20("CarbonCoin", "CO2") {admin = msg.sender;}

    address public admin;
    mapping (address => uint256) public nextMint;
    uint256 private maximumMintCap = 50;
    uint256 private mintAmount = 0; 
    uint256 private mintDelay = 24 * 60 * 60;

    modifier onlyAdmin(){
        require(msg.sender == admin, "Access forbidden, only admin");
        _;
    }

    function mint(address _to, uint256 _predictedGasCost) public onlyAdmin {
        require(mintAmount > 0, "Minting is not enabled");
        require(_predictedGasCost < address(this).balance, "Not enough balance for minting"); //how to handle no suficient gas?
        require(nextMint[_to] < block.timestamp, "Only one mint per address in a row");
        require(_to.balance >= 1 ether / 1000, "Minimum balance amount of 0.001 ETH needed");
        _mint(_to, mintAmount);
        nextMint[_to] = block.timestamp + mintDelay;
    }

    function setMaxMintingCap(uint256 _maximumMintCap) public onlyAdmin {
        maximumMintCap = _maximumMintCap;
    }

    function setMintAmount(uint256 _mintAmount) public onlyAdmin {
        mintAmount = _mintAmount;
    }

    function setMintDelay(uint64 _mintDelay) public onlyAdmin {
        mintDelay = _mintDelay;
    }
}