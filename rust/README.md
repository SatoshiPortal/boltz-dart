# boltz-dart 

The language bindings library `boltz-dart`, written for `boltz-rust`, will have a more abstracted api.

The final dart API would ideally look as follows:

### SUBMARINE SWAP - PAYING EXTERNAL LN WALLET

m/purpose/network/21/0/*

```dart

import 'package:boltz_client_flutter/boltz_client_flutter.dart';
final network = BitcoinNetwork.Mainnet;
final electrumUrl = 'electrum.bullbitcoin.com:50002'
final boltzUrl = 'api.boltz.exchange';

final index = 12;
final keyPair = KeyPair.fromMnemonic('bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon, index);
final invoice = 'lnbc1...scanned-by-user-paying-external-ln-wallet...;

final fees = BtcSwapScript.getFees(boltzUrl);

final boltzBtcSubmarineSwap  = BtcSwapScript.newSubmarine(
    network,
    electrumUrl,
    boltzUrl,
    keyPair,
    invoice
);

final paymentDetails = boltzBtcSubarineSwap.paymentDetails();
// Construct local transaction to pay lockup_address from boltz with given amount
final txid = localWallet.send(paymentDetails.0, paymentDetails.1);
final status = boltzBtcSubmarineSwap.status();

// invoice will be paid by boltz. If not, we must refund after timeout
final address = localWallet.getNewAddress();
final absoluteFees = read.userInput();
final txid = boltzBtcSubmarineSwap.refund(address, absoluteFees);

```

### REVERSE SWAP - RECIEVING FROM EXTERNAL LN WALLET

m/purpose/network/42/0/*

```dart
final index = 13;
final keyPair = KeyPairString.fromMnemonic('bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon', index);
final preImage = PreimageStates.new();
final outValue = 100000;
final fees = BtcSwapScript.getFees(boltzUrl);
final boltzBtcReverseSwap  = BtcSwapScript.newReverse(
    network,
    electrumUrl,
    boltzUrl,
    keyPair,
    preImage,
    outValue
);
final paymentDetails = boltzBtcReverseSwap.paymentDetails();
// Pay invoice provided by boltz (user is recieving a payment from an external LN wallet)
final status = boltzBtcReverseSwap.status();
// Construct swap transaction to claim lockup_address from boltz with given amount
// Genereate outputAddresss from local wallet
final address = localWallet.getNewAddress();
final absoluteFees = read.userInput();
final txid = boltzBtcReverseSwap.claim(address, fees);
```