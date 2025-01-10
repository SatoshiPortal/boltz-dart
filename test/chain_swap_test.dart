// import 'dart:async';

// import 'package:boltz/boltz.dart';
// import 'package:test/test.dart';

// // const mnemonic =
// //     'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
// const mnemonic =
//     'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial';
// const index = 0;
// const network = Chain.bitcoinTestnet;
// const electrumUrl = 'electrum.blockstream.info:60002';
// const lElectrumUrl = 'blockstream.info:465';
// const boltzUrl = 'https://api.testnet.boltz.exchange/v2';

// const btcClaimAddress =
//     'tb1qlmj5w2upndhhc9rgd9jg07vcuafg3jydef7uvz'; // Vegeta wallet
// const lqClaimAddress =
//     'tlq1qqd8f92dfedpvsydxxk54l8glwa5m8e84ygqz7n5dgyujp37v3n60pjzfrc2xu4a9fla6snzgznn9tjpwc99d7kn2s472sw2la';
// const btcRefundAddress =
//     'tb1qlmj5w2upndhhc9rgd9jg07vcuafg3jydef7uvz'; // Vegeta wallet
// const lqRefundAddress =
//     'tlq1qqd8f92dfedpvsydxxk54l8glwa5m8e84ygqz7n5dgyujp37v3n60pjzfrc2xu4a9fla6snzgznn9tjpwc99d7kn2s472sw2la';

// const lnetwork = Chain.liquidTestnet;
// const testTimeout = Timeout(Duration(minutes: 30));

// void main() {
//   // setUp(() async => await LibBoltz.init());
//   test('Swap status string', () {
//     final status = SwapStatus.invoiceFailedToPay;
//     expect(status.asString, 'Invoice failed to pay');
//   });

//   test('BTC -> LQ', () async {
//     try {
//       await LibBoltz.init();
//       final swap = await ChainSwap.newSwap(
//           direction: ChainSwapDirection.btcToLbtc,
//           mnemonic: mnemonic,
//           index: index,
//           amount: 1000000,
//           isTestnet: true,
//           btcElectrumUrl: electrumUrl,
//           lbtcElectrumUrl: lElectrumUrl,
//           boltzUrl: boltzUrl);

//       print('Refund Keys: ');
//       print(swap.refundKeys);
//       print(swap.refundIndex);
//       print('Claim Keys: ');
//       print(swap.claimKeys);
//       print(swap.claimIndex);
//       print('Preimage: ');
//       print(swap.preimage);

//       print('Blinding key: ');
//       print(swap.blindingKey);

//       print('Script: ');
//       print('btc script str: ${swap.btcScriptStr}');
//       print('lbtc script str: ${swap.lbtcScriptStr}');

//       print('------------------------------------');
//       print('swap id: ${swap.id}');
//       print('pay to: ${swap.scriptAddress}');

//       var completer = Completer();
//       var receivedEvents = <SwapStreamStatus>[];
//       final api = await BoltzApi.newBoltzApi(boltzUrl);
//       var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
//         try {
//           print(event);
//           if (event.status == SwapStatus.txnServerConfirmed) {
//             final id = await swap.claim(
//                 outAddress: lqClaimAddress,
//                 refundAddress: btcRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.txnLockupFailed) {
//             final id = await swap.refund(
//                 refundAddress: btcRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.swapError) {
//             print('error');
//           } else if (event.status == SwapStatus.swapExpired) {
//             print('expired');
//           }
//         } catch (subErr) {
//           print(subErr);
//         }
//       });
//       await completer.future;

//       await sub.cancel();
//     } catch (e) {
//       print(e);
//     }
//   });

//   test('LQ -> BTC', () async {
//     try {
//       await LibBoltz.init();
//       final swap = await ChainSwap.newSwap(
//           direction: ChainSwapDirection.lbtcToBtc,
//           mnemonic: mnemonic,
//           index: index,
//           amount: 1000000,
//           isTestnet: true,
//           btcElectrumUrl: electrumUrl,
//           lbtcElectrumUrl: lElectrumUrl,
//           boltzUrl: boltzUrl);

//       print('Refund Keys: ');
//       print(swap.refundKeys);
//       print(swap.refundIndex);
//       print('Claim Keys: ');
//       print(swap.claimKeys);
//       print(swap.claimIndex);
//       print('Preimage: ');
//       print(swap.preimage);

//       print('Blinding key: ');
//       print(swap.blindingKey);

//       print('Script: ');
//       print('btc script str: ${swap.btcScriptStr}');
//       print('lbtc script str: ${swap.lbtcScriptStr}');

//       print('------------------------------------');
//       print('swap id: ${swap.id}');
//       print('pay to: ${swap.scriptAddress}');

//       var completer = Completer();
//       var receivedEvents = <SwapStreamStatus>[];
//       final api = await BoltzApi.newBoltzApi(boltzUrl);
//       var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
//         try {
//           print(event);
//           if (event.status == SwapStatus.txnServerConfirmed) {
//             final id = await swap.claim(
//                 outAddress: btcClaimAddress,
//                 refundAddress: lqRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.txnLockupFailed) {
//             final id = await swap.refund(
//                 refundAddress: lqRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.swapError) {
//             print('error');
//           } else if (event.status == SwapStatus.swapExpired) {
//             print('expired');
//           }
//         } catch (subErr) {
//           print(subErr);
//         }
//       });
//       await completer.future;

//       await sub.cancel();
//     } catch (e) {
//       print(e);
//     }
//   });

//   test('BTC -> LQ: retry', () async {
//     try {
//       await LibBoltz.init();
//       final swap = ChainSwap(
//           id: 'I3pUfsRfr15Q',
//           refundIndex: 0,
//           claimIndex: 1,
//           direction: ChainSwapDirection.btcToLbtc,
//           refundKeys: KeyPair(
//               publicKey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               secretKey:
//                   '9c68d4e1eb5430a61ce6f66cf77d641dcaa131987d89d6653d0bd176dd7e9dbb'),
//           claimKeys: KeyPair(
//               publicKey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               secretKey:
//                   'bca0b151b79d31e9f6146797fe39b960d3149f9040bbb4fcbfec50e6464eb77d'),
//           preimage: PreImage(
//               value:
//                   '0bdb918bc9c66943ac7db246a2d46ccd507486f6eafd7a7b9a59d83d5e2ad4a0',
//               sha256:
//                   'ec54c4b0551a035f55627ac8ce3d820c78a65eb01c8564d9fdf0f618228b00c7',
//               hash160: '941b9ab9e4c1c11160030c8a859df6868a92e2a7'),
//           scriptAddress:
//               'tb1p7smy7ljv4v26mwhzw0rq6n6vvzhy5kxu2u7rxnkjz3ss29pmmf2qt2s7td',
//           btcScriptStr: BtcSwapScriptStr(
//               hashlock: '941b9ab9e4c1c11160030c8a859df6868a92e2a7',
//               swapType: SwapType.chain,
//               receiverPubkey:
//                   '031544d5d01dd6790ed9065725945bad6dd8534bae124b5b9d54f82a8278548f31',
//               locktime: 2866676,
//               senderPubkey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               fundingAddrs:
//                   'tb1p7smy7ljv4v26mwhzw0rq6n6vvzhy5kxu2u7rxnkjz3ss29pmmf2qt2s7td',
//               side: Side.lockup),
//           lbtcScriptStr: LBtcSwapScriptStr(
//               swapType: SwapType.chain,
//               fundingAddrs:
//                   'tlq1pqwrjlg9cq9u9d2fes40rvplr6028skkphfdq9mc85kl37aktjlc4yk96qekdfnlyje223xfwjkzjs503vdh7elmhjaxh64g62s3wapfeh56n4hfcdyrx',
//               hashlock: '941b9ab9e4c1c11160030c8a859df6868a92e2a7',
//               receiverPubkey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               locktime: 1469413,
//               senderPubkey:
//                   '02ac37b6ca3dbb6879ea7e05a4d8a5273ff11e6c94d366ab4a16ed5ef15ed0f321',
//               blindingKey:
//                   'ab9a7225352314628d7ad7c5af4d340823f1184928e9abf4dc0a5d252b124ad6',
//               side: Side.claim),
//           outAmount: 1000000,
//           blindingKey:
//               'ab9a7225352314628d7ad7c5af4d340823f1184928e9abf4dc0a5d252b124ad6',
//           isTestnet: true,
//           btcElectrumUrl: electrumUrl,
//           lbtcElectrumUrl: lElectrumUrl,
//           boltzUrl: boltzUrl);

//       final id = await swap.claim(
//           outAddress: lqClaimAddress,
//           refundAddress: btcRefundAddress,
//           absFee: 3000,
//           tryCooperate: true);

//       var completer = Completer();
//       var receivedEvents = <SwapStreamStatus>[];
//       final api = await BoltzApi.newBoltzApi(boltzUrl);
//       var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
//         try {
//           print(event);
//           if (event.status == SwapStatus.txnMempool) {
//             print('user tx mempool');
//           } else if (event.status == SwapStatus.txnConfirmed) {
//             print('user tx confirmed');
//           } else if (event.status == SwapStatus.txnServerMempool) {
//             print('boltz tx mempool');
//           } else if (event.status == SwapStatus.txnServerConfirmed) {
//             print('boltz tx confirmed');
//           } else if (event.status == SwapStatus.txnLockupFailed) {
//             final id = await swap.refund(
//                 refundAddress: btcRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.swapError) {
//             print('error');
//           } else if (event.status == SwapStatus.swapExpired) {
//             print('expired');
//           }
//         } catch (subErr) {
//           print(subErr);
//         }
//       });
//       await completer.future;

//       await sub.cancel();
//     } catch (e) {
//       print(e);
//     }
//   });

//   test('LQ -> BTC: retry1', () async {
//     try {
//       await LibBoltz.init();
//       final swap = ChainSwap(
//           id: 'RXysRSzKfAbU',
//           refundIndex: 0,
//           claimIndex: 1,
//           direction: ChainSwapDirection.lbtcToBtc,
//           refundKeys: KeyPair(
//               publicKey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               secretKey:
//                   '9c68d4e1eb5430a61ce6f66cf77d641dcaa131987d89d6653d0bd176dd7e9dbb'),
//           claimKeys: KeyPair(
//               publicKey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               secretKey:
//                   'bca0b151b79d31e9f6146797fe39b960d3149f9040bbb4fcbfec50e6464eb77d'),
//           preimage: PreImage(
//               value:
//                   '74c4af7f165d89db8c2b893003a9a7973e1facedaba5e9b170ae453d651fddca',
//               sha256:
//                   'f9f71c70c46913f68e3ffe263f52427d889b80825d2e5ef40e2024ad90bf147f',
//               hash160: '995dba7fbf52671a48e5ed862261342fd0026cd6'),
//           scriptAddress:
//               'tlq1pqg3c59g4k8gl3r90gkz3ynrnqg7vennlhwxyeqsvgrytvzddafcdksnafqq020q6u3v89mxzwfef67900l4fz4ykzd4ga7l5ke7a6x8jrj25g603s3v4',
//           btcScriptStr: BtcSwapScriptStr(
//               hashlock: '995dba7fbf52671a48e5ed862261342fd0026cd6',
//               swapType: SwapType.chain,
//               receiverPubkey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               locktime: 2866856,
//               senderPubkey:
//                   '02680d3a7194be0e2360e3106b13536782e91db44bf7f0268d22ca6a0acd648592',
//               fundingAddrs:
//                   'tb1pfh64gzt7eyljfxqt6nsew30ay4f7hksfxgvcc9ug35hl76tcnwrs4vjfs3',
//               side: Side.claim),
//           lbtcScriptStr: LBtcSwapScriptStr(
//               swapType: SwapType.chain,
//               fundingAddrs:
//                   'tlq1pqg3c59g4k8gl3r90gkz3ynrnqg7vennlhwxyeqsvgrytvzddafcdksnafqq020q6u3v89mxzwfef67900l4fz4ykzd4ga7l5ke7a6x8jrj25g603s3v4',
//               hashlock: '995dba7fbf52671a48e5ed862261342fd0026cd6',
//               receiverPubkey:
//                   '036ef26a4b758b1a6f52485fad0f7c341ac060d683e2763250c6a0924b7ede7a0a',
//               locktime: 1470803,
//               senderPubkey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               blindingKey:
//                   '1b13a1c3e5884848505f36d1082a08cdc3762bb51a4cb2b5258c9ef8b18f8812',
//               side: Side.lockup),
//           outAmount: 1000000,
//           blindingKey:
//               '1b13a1c3e5884848505f36d1082a08cdc3762bb51a4cb2b5258c9ef8b18f8812',
//           isTestnet: true,
//           btcElectrumUrl: electrumUrl,
//           lbtcElectrumUrl: lElectrumUrl,
//           boltzUrl: boltzUrl);

//       final id = await swap.claim(
//           outAddress: btcClaimAddress,
//           refundAddress: lqRefundAddress,
//           absFee: 3000,
//           tryCooperate: true);

//       var completer = Completer();
//       var receivedEvents = <SwapStreamStatus>[];
//       final api = await BoltzApi.newBoltzApi(boltzUrl);
//       var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
//         try {
//           print(event);
//           if (event.status == SwapStatus.txnMempool) {
//             print('user tx mempool');
//           } else if (event.status == SwapStatus.txnConfirmed) {
//             print('user tx confirmed');
//           } else if (event.status == SwapStatus.txnServerMempool) {
//             print('boltz tx mempool');
//           } else if (event.status == SwapStatus.txnServerConfirmed) {
//             print('boltz tx confirmed');
//           } else if (event.status == SwapStatus.txnLockupFailed) {
//             final id = await swap.refund(
//                 refundAddress: btcRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.swapError) {
//             print('error');
//           } else if (event.status == SwapStatus.swapExpired) {
//             print('expired');
//           }
//         } catch (subErr) {
//           print(subErr);
//         }
//       });
//       await completer.future;

//       await sub.cancel();
//     } catch (e) {
//       print(e);
//     }
//   });

//   test('LQ -> BTC: retry2', () async {
//     try {
//       await LibBoltz.init();
//       final swap = ChainSwap(
//           id: 'YTmsNXsztoFx',
//           refundIndex: 0,
//           claimIndex: 1,
//           direction: ChainSwapDirection.lbtcToBtc,
//           refundKeys: KeyPair(
//               publicKey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               secretKey:
//                   '9c68d4e1eb5430a61ce6f66cf77d641dcaa131987d89d6653d0bd176dd7e9dbb'),
//           claimKeys: KeyPair(
//               publicKey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               secretKey:
//                   'bca0b151b79d31e9f6146797fe39b960d3149f9040bbb4fcbfec50e6464eb77d'),
//           preimage: PreImage(
//               value:
//                   '74c4af7f165d89db8c2b893003a9a7973e1facedaba5e9b170ae453d651fddca',
//               sha256:
//                   'f9f71c70c46913f68e3ffe263f52427d889b80825d2e5ef40e2024ad90bf147f',
//               hash160: '995dba7fbf52671a48e5ed862261342fd0026cd6'),
//           scriptAddress:
//               'tlq1pqg3c59g4k8gl3r90gkz3ynrnqg7vennlhwxyeqsvgrytvzddafcdksnafqq020q6u3v89mxzwfef67900l4fz4ykzd4ga7l5ke7a6x8jrj25g603s3v4',
//           btcScriptStr: BtcSwapScriptStr(
//               hashlock: '995dba7fbf52671a48e5ed862261342fd0026cd6',
//               swapType: SwapType.chain,
//               receiverPubkey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               locktime: 2866856,
//               senderPubkey:
//                   '02680d3a7194be0e2360e3106b13536782e91db44bf7f0268d22ca6a0acd648592',
//               fundingAddrs:
//                   'tb1pfh64gzt7eyljfxqt6nsew30ay4f7hksfxgvcc9ug35hl76tcnwrs4vjfs3',
//               side: Side.claim),
//           lbtcScriptStr: LBtcSwapScriptStr(
//               swapType: SwapType.chain,
//               fundingAddrs:
//                   'tlq1pqg3c59g4k8gl3r90gkz3ynrnqg7vennlhwxyeqsvgrytvzddafcdksnafqq020q6u3v89mxzwfef67900l4fz4ykzd4ga7l5ke7a6x8jrj25g603s3v4',
//               hashlock: '995dba7fbf52671a48e5ed862261342fd0026cd6',
//               receiverPubkey:
//                   '036ef26a4b758b1a6f52485fad0f7c341ac060d683e2763250c6a0924b7ede7a0a',
//               locktime: 1470803,
//               senderPubkey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               blindingKey:
//                   '1b13a1c3e5884848505f36d1082a08cdc3762bb51a4cb2b5258c9ef8b18f8812',
//               side: Side.lockup),
//           outAmount: 1000000,
//           blindingKey:
//               '1b13a1c3e5884848505f36d1082a08cdc3762bb51a4cb2b5258c9ef8b18f8812',
//           isTestnet: true,
//           btcElectrumUrl: electrumUrl,
//           lbtcElectrumUrl: lElectrumUrl,
//           boltzUrl: boltzUrl);

//       final id = await swap.claim(
//           outAddress: btcClaimAddress,
//           refundAddress: lqRefundAddress,
//           absFee: 3000,
//           tryCooperate: true);

//       var completer = Completer();
//       var receivedEvents = <SwapStreamStatus>[];
//       final api = await BoltzApi.newBoltzApi(boltzUrl);
//       var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
//         try {
//           print(event);
//           if (event.status == SwapStatus.txnMempool) {
//             print('user tx mempool');
//           } else if (event.status == SwapStatus.txnConfirmed) {
//             print('user tx confirmed');
//           } else if (event.status == SwapStatus.txnServerMempool) {
//             print('boltz tx mempool');
//           } else if (event.status == SwapStatus.txnServerConfirmed) {
//             print('boltz tx confirmed');
//           } else if (event.status == SwapStatus.txnLockupFailed) {
//             final id = await swap.refund(
//                 refundAddress: btcRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.swapError) {
//             print('error');
//           } else if (event.status == SwapStatus.swapExpired) {
//             print('expired');
//           }
//         } catch (subErr) {
//           print(subErr);
//         }
//       });
//       await completer.future;

//       await sub.cancel();
//     } catch (e) {
//       print(e);
//     }
//   });

//   test('LQ -> BTC: retry3', () async {
//     try {
//       await LibBoltz.init();
//       final swap = ChainSwap(
//           id: 'cdTCvkKUgfsS',
//           refundIndex: 0,
//           claimIndex: 1,
//           direction: ChainSwapDirection.lbtcToBtc,
//           refundKeys: KeyPair(
//               publicKey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               secretKey:
//                   '9c68d4e1eb5430a61ce6f66cf77d641dcaa131987d89d6653d0bd176dd7e9dbb'),
//           claimKeys: KeyPair(
//               publicKey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               secretKey:
//                   'bca0b151b79d31e9f6146797fe39b960d3149f9040bbb4fcbfec50e6464eb77d'),
//           preimage: PreImage(
//               value:
//                   'e980056a8b7f171924046306cfe9c5405bb22f470d551780302e35d4b71bcc14',
//               sha256:
//                   '311d4f2ce23ae00a538f4fd8379c752b3e0a6e02ae6aa0cd84ba1a8ec3d3eea4',
//               hash160: 'f1f66a9d22239a3944902302e8b7bc1d7531571c'),
//           scriptAddress:
//               'tlq1pqw5tadha5cy6rdwkfl0ueyzu5j8kwx69hngsrllv0zl3md8njtmg3nkjxuku9hs2t0dum8rr8neeum9064e6y2aa2vcr5wcgr83tupda3lg7e657v69j',
//           btcScriptStr: BtcSwapScriptStr(
//               hashlock: 'f1f66a9d22239a3944902302e8b7bc1d7531571c',
//               swapType: SwapType.chain,
//               receiverPubkey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               locktime: 2866865,
//               senderPubkey:
//                   '028ede3e4e20837720f4210982aa1f2406615d75b637564d8b1290e12eac09049b',
//               fundingAddrs:
//                   'tb1pwq6cfr66kh5qzfqemusc7t3zfdmdw2phgym9s64w3vdexr0l7gzqsnquau',
//               side: Side.claim),
//           lbtcScriptStr: LBtcSwapScriptStr(
//               swapType: SwapType.chain,
//               fundingAddrs:
//                   'tlq1pqw5tadha5cy6rdwkfl0ueyzu5j8kwx69hngsrllv0zl3md8njtmg3nkjxuku9hs2t0dum8rr8neeum9064e6y2aa2vcr5wcgr83tupda3lg7e657v69j',
//               hashlock: 'f1f66a9d22239a3944902302e8b7bc1d7531571c',
//               receiverPubkey:
//                   '02b6dc92e0ad01326dfa9d8fdefec53bb75452693c0b57b7e7a81e1b0955d4a023',
//               locktime: 1470879,
//               senderPubkey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               blindingKey:
//                   'fe5cf877d251edd1605183dcd8e2919ed6d17d8523a4fe32d216eb2b4077fb4f',
//               side: Side.lockup),
//           outAmount: 1000000,
//           blindingKey:
//               'fe5cf877d251edd1605183dcd8e2919ed6d17d8523a4fe32d216eb2b4077fb4f',
//           isTestnet: true,
//           btcElectrumUrl: electrumUrl,
//           lbtcElectrumUrl: lElectrumUrl,
//           boltzUrl: boltzUrl);

//       final id = await swap.claim(
//           outAddress: btcClaimAddress,
//           refundAddress: lqRefundAddress,
//           absFee: 3000,
//           tryCooperate: true);
//       print(id);

//       var completer = Completer();
//       var receivedEvents = <SwapStreamStatus>[];
//       final api = await BoltzApi.newBoltzApi(boltzUrl);
//       var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
//         try {
//           print(event);
//           if (event.status == SwapStatus.txnMempool) {
//             print('user tx mempool');
//           } else if (event.status == SwapStatus.txnConfirmed) {
//             print('user tx confirmed');
//           } else if (event.status == SwapStatus.txnServerMempool) {
//             print('boltz tx mempool');
//           } else if (event.status == SwapStatus.txnServerConfirmed) {
//             print('boltz tx confirmed');

//             final id = await swap.claim(
//                 outAddress: btcClaimAddress,
//                 refundAddress: lqRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.txnLockupFailed) {
//             final id = await swap.refund(
//                 refundAddress: btcRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.swapError) {
//             print('error');
//           } else if (event.status == SwapStatus.swapExpired) {
//             print('expired');
//           }
//         } catch (subErr) {
//           print(subErr);
//         }
//       });
//       await completer.future;

//       await sub.cancel();
//     } catch (e) {
//       print(e);
//     }
//   });

//   test('LQ -> BTC: retry4', () async {
//     try {
//       await LibBoltz.init();
//       final swap = ChainSwap(
//           id: '43JDmsbFs84p',
//           refundIndex: 0,
//           claimIndex: 1,
//           direction: ChainSwapDirection.lbtcToBtc,
//           refundKeys: KeyPair(
//               publicKey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               secretKey:
//                   '9c68d4e1eb5430a61ce6f66cf77d641dcaa131987d89d6653d0bd176dd7e9dbb'),
//           claimKeys: KeyPair(
//               publicKey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               secretKey:
//                   'bca0b151b79d31e9f6146797fe39b960d3149f9040bbb4fcbfec50e6464eb77d'),
//           preimage: PreImage(
//               value:
//                   'a8ef37e923b41ce93ffe4243896dcca7437ed88b26129229cacfc4a87f106f08',
//               sha256:
//                   '801145d6500e9a7a415fc1e163cb1f047017d1715d8ea01fc6e4a72ac8e637e3',
//               hash160: 'd4890734a8fd9b3fb3ebf70c36a735944f316219'),
//           scriptAddress:
//               'tlq1pqdndxvh44fm50wfwf5d5zh0rhapkzks5p5gmuud50g5ajjqvuaq9yl34gwdnasy00c53cnfyvpt5gqg2w0p0zdd9080d3uj62t0aqafu6luffmw4mmlf',
//           btcScriptStr: BtcSwapScriptStr(
//               hashlock: 'd4890734a8fd9b3fb3ebf70c36a735944f316219',
//               swapType: SwapType.chain,
//               receiverPubkey:
//                   '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
//               locktime: 2866869,
//               senderPubkey:
//                   '02d2abe85c3e081df4dce708e02a345d1747927fa7aa4765e91e5a40aaf2236cd9',
//               fundingAddrs:
//                   'tb1pm0qp6a6g4g9lpghhxtkvw3ztg0kp2cvk7rjnvejkwxwup6xgczhq7r46es',
//               side: Side.claim),
//           lbtcScriptStr: LBtcSwapScriptStr(
//               swapType: SwapType.chain,
//               fundingAddrs:
//                   'tlq1pqdndxvh44fm50wfwf5d5zh0rhapkzks5p5gmuud50g5ajjqvuaq9yl34gwdnasy00c53cnfyvpt5gqg2w0p0zdd9080d3uj62t0aqafu6luffmw4mmlf',
//               hashlock: 'd4890734a8fd9b3fb3ebf70c36a735944f316219',
//               receiverPubkey:
//                   '038b68d356638830e9ca8334c257380b07310d7348b1f7658687fef8678911c1f3',
//               locktime: 1470896,
//               senderPubkey:
//                   '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
//               blindingKey:
//                   '9fb1dd478bc6baa109f2470db50357a327430642f8118166bdd8d5d589efb238',
//               side: Side.lockup),
//           outAmount: 1000000,
//           blindingKey:
//               '9fb1dd478bc6baa109f2470db50357a327430642f8118166bdd8d5d589efb238',
//           isTestnet: true,
//           btcElectrumUrl: electrumUrl,
//           lbtcElectrumUrl: lElectrumUrl,
//           boltzUrl: boltzUrl);

//       var completer = Completer();
//       var receivedEvents = <SwapStreamStatus>[];
//       final api = await BoltzApi.newBoltzApi(boltzUrl);
//       var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
//         try {
//           print(event);

//           final id = await swap.claim(
//               outAddress: btcClaimAddress,
//               refundAddress: lqRefundAddress,
//               absFee: 3000,
//               tryCooperate: true);
//           print(id);
//           if (event.status == SwapStatus.txnMempool) {
//             print('user tx mempool');
//           } else if (event.status == SwapStatus.txnConfirmed) {
//             print('user tx confirmed');
//           } else if (event.status == SwapStatus.txnServerMempool) {
//             print('boltz tx mempool');
//           } else if (event.status == SwapStatus.txnServerConfirmed) {
//             print('boltz tx confirmed');

//             final id = await swap.claim(
//                 outAddress: btcClaimAddress,
//                 refundAddress: lqRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.txnLockupFailed) {
//             final id = await swap.refund(
//                 refundAddress: btcRefundAddress,
//                 absFee: 3000,
//                 tryCooperate: true);
//             print(id);
//           } else if (event.status == SwapStatus.swapError) {
//             print('error');
//           } else if (event.status == SwapStatus.swapExpired) {
//             print('expired');
//           }
//         } catch (subErr) {
//           print(subErr);
//         }
//       });
//       await completer.future;

//       await sub.cancel();
//     } catch (e) {
//       print(e);
//     }
//   });
// }
