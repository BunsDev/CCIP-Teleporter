// (c) 2023, Ava Labs, Inc. All rights reserved.
// See the file LICENSE for licensing terms.

// SPDX-License-Identifier: Ecosystem

pragma solidity 0.8.20;

import "https://github.com/ava-labs/teleporter/blob/main/contracts/src/Teleporter/ITeleporterMessenger.sol";
import "https://github.com/ava-labs/teleporter/blob/main/contracts/src/Teleporter/ITeleporterReceiver.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {TeleporterCCIPBnM} from "./tCCIP-BnM.sol";

contract ReceiverOnDispatch is ITeleporterReceiver, Ownable {
    constructor(address initialOwner)
        Ownable(initialOwner)
    {}
    ITeleporterMessenger public immutable teleporterMessenger = ITeleporterMessenger(0x253b2784c75e510dD0fF1da844684a1aC0aa5fcf);

    string public lastMessage;
    address token_contract_address = address(0);

    function set_token_contract_address (address _address) external onlyOwner{
        token_contract_address = _address;
    }

    function receiveTeleporterMessage(
        bytes32 originChainID,
        address originSenderAddress,
        bytes calldata message
    ) external {
        // Only the Teleporter receiver can deliver a message.
        require(msg.sender == address(teleporterMessenger), "ReceiverOnDispatch: unauthorized TeleporterMessenger");
        // Decoding the function parameters
        (
            uint256 amount,
            address recipient,
            address token_address
        ) = abi.decode(message, (uint256, address, address));
        //call the token contract
        //TeleporterCCIPBnM token_contract = TeleporterCCIPBnM(token_contract_address);
        //trigger the teleporter
        TeleporterCCIPBnM(token_contract_address).mint(recipient, amount);
        // Store the message.
        lastMessage = abi.decode(message, (string));
    }
}