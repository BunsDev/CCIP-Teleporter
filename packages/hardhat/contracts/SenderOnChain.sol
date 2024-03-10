// (c) 2023, Ava Labs, Inc. All rights reserved.
// See the file LICENSE for licensing terms.

// SPDX-License-Identifier: Ecosystem

pragma solidity 0.8.20;

import "https://github.com/ava-labs/teleporter/blob/main/contracts/src/Teleporter/ITeleporterMessenger.sol";
import "@openzeppelin/contracts@5.0.2/access/AccessControl.sol";

contract SenderOnChain is AccessControl{
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    ITeleporterMessenger public immutable teleporterMessenger = ITeleporterMessenger(0x253b2784c75e510dD0fF1da844684a1aC0aa5fcf);
    constructor(address defaultAdmin, address minter)
    {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }
    /**
     * @dev Sends a message to another chain.
     */
    function sendMessage(
        address destinationAddress,
        bytes calldata message
    ) external {
        teleporterMessenger.sendCrossChainMessage(
            TeleporterMessageInput({
                destinationBlockchainID: 0x9f3be606497285d0ffbb5ac9ba24aa60346a9b1812479ed66cb329f394a4b1c7,
                destinationAddress: destinationAddress,
                feeInfo: TeleporterFeeInfo({
                    feeTokenAddress: address(0),
                    amount: 0
                }),
                requiredGasLimit: 100000,
                allowedRelayerAddresses: new address[](0),
                message: message
            })
        );
    }
    /*
     *destinationBlockchainID: 0x9f3be606497285d0ffbb5ac9ba24aa60346a9b1812479ed66cb329f394a4b1c7 
     *destinationAddress: address of ReceiverOnDispatch
     *calldata message: _amount and _to
     *
     *
     */
    // bytes message = abi.encode(
    //     _amount,
    //     _recipient,
    //     _token
    // );
}