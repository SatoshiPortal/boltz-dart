import 'dart:async';

import 'package:boltz_dart/boltz_dart.dart';
import 'package:test/test.dart';

// const mnemonic =
//     'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
const mnemonic =
    'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial';
const index = 0;
const network = Chain.bitcoinTestnet;
const electrumUrl = 'electrum.blockstream.info:60002';
const lElectrumUrl = 'blockstream.info:465';
const boltzUrl = 'https://api.testnet.boltz.exchange/v2';

const btcClaimAddress = '';
const lqClaimAddress =
    'tlq1qqd8f92dfedpvsydxxk54l8glwa5m8e84ygqz7n5dgyujp37v3n60pjzfrc2xu4a9fla6snzgznn9tjpwc99d7kn2s472sw2la';
const refundAddress =
    'tb1pr6zcqjmh4dvs2lpv269ej4jyk4zq8f3q65laj0q02elcglvyw7ysgvrd3c';

const lnetwork = Chain.liquidTestnet;
const testTimeout = Timeout(Duration(minutes: 30));

void main() {
  // setUp(() async => await LibBoltz.init());
  test('Swap status string', () {
    final status = SwapStatus.invoiceFailedToPay;
    expect(status.asString, 'Invoice failed to pay');
  });

  test('BTC -> LQ', () async {
    try {
      await LibBoltz.init();
      final swap = await ChainSwap.newSwap(
          direction: ChainSwapDirection.btcToLbtc,
          mnemonic: mnemonic,
          index: index,
          amount: 1000000,
          isTestnet: true,
          btcElectrumUrl: electrumUrl,
          lbtcElectrumUrl: lElectrumUrl,
          boltzUrl: boltzUrl);

      print('Refund Keys: ');
      print(swap.refundKeys);
      print(swap.refundIndex);
      print('Claim Keys: ');
      print(swap.claimKeys);
      print(swap.claimIndex);
      print('Preimage: ');
      print(swap.preimage);

      print('Blinding key: ');
      print(swap.blindingKey);

      print('Script: ');
      print('btc script str: ${swap.btcScriptStr}');
      print('lbtc script str: ${swap.lbtcScriptStr}');

      print('------------------------------------');
      print('swap id: ${swap.id}');
      print('pay to: ${swap.scriptAddress}');

      var completer = Completer();
      var receivedEvents = <SwapStreamStatus>[];
      final api = await BoltzApi.newBoltzApi(boltzUrl);
      var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
        try {
          print(event);
          if (event.status == SwapStatus.txnServerConfirmed) {
            final id = await swap.claim(
                outAddress: lqClaimAddress,
                refundAddress: refundAddress,
                absFee: 3000,
                tryCooperate: true);
            print(id);
          } else if (event.status == SwapStatus.txnLockupFailed) {
            final id = await swap.refund(
                refundAddress: refundAddress, absFee: 3000, tryCooperate: true);
            print(id);
          } else if (event.status == SwapStatus.swapError) {
            print('error');
          } else if (event.status == SwapStatus.swapExpired) {
            print('expired');
          }
        } catch (subErr) {
          print(subErr);
        }
      });
      await completer.future;

      await sub.cancel();
    } catch (e) {
      print(e);
    }
  });

  test('BTC -> LQ: retry', () async {
    try {
      await LibBoltz.init();
      final swap = ChainSwap(
          id: 'D3BNWYLEVuQY',
          refundIndex: 0,
          claimIndex: 0,
          direction: ChainSwapDirection.btcToLbtc,
          refundKeys: KeyPair(
              publicKey:
                  '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
              secretKey:
                  '9c68d4e1eb5430a61ce6f66cf77d641dcaa131987d89d6653d0bd176dd7e9dbb'),
          claimKeys: KeyPair(
              publicKey:
                  '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
              secretKey:
                  'bca0b151b79d31e9f6146797fe39b960d3149f9040bbb4fcbfec50e6464eb77d'),
          preimage: PreImage(
              value:
                  '36906385ab6f14de1cdd9e28e0823a80bb8d50c325703db3e1d9ac814f411613',
              sha256:
                  'e829ed3c82e29bf67c015098e528c05b08ee6f35e9ba8383ac52877920e553c0',
              hash160: '261392d44f64d974bb2fae45cfc9297945a8ebf9'),
          scriptAddress:
              'tb1p2g36kq9wv0knn6g0rhhpvxsf4x0ywpjpufxarpljf6zgd2ey7lxswradyl',
          btcScriptStr: BtcSwapScriptStr(
              hashlock: '261392d44f64d974bb2fae45cfc9297945a8ebf9',
              swapType: SwapType.chain,
              receiverPubkey:
                  '0334b80c46bdbe99dfa6effd6ff09d477819ce4fb9093c89b2275e9dc807b96566',
              locktime: 2865950,
              senderPubkey:
                  '03950d3fdc1d6884d3dca153ff8b0952383622e9f70035faae4fe13c91ff293c4f',
              fundingAddrs:
                  'tb1p2g36kq9wv0knn6g0rhhpvxsf4x0ywpjpufxarpljf6zgd2ey7lxswradyl'),
          lbtcScriptStr: LBtcSwapScriptStr(
              swapType: SwapType.chain,
              hashlock: '261392d44f64d974bb2fae45cfc9297945a8ebf9',
              receiverPubkey:
                  '03b24dc5e85e809be62262f17574f73620073460839d4e720ec91398d890a49aa6',
              locktime: 1465136,
              senderPubkey:
                  '034524293d32f852a802dae2d2a53adfc55452b3a5f3c48b724e8be594e1348819',
              fundingAddrs:
                  'tlq1pq07844at23e90f9rhj4gk37595l9favjyvn8yhquuqyxw7qxyxafrgftmhla8nywfl6xkx6ml9xa20rdmxj6ya2cp54x6s2ddqf600jeapl50yd45exk',
              blindingKey:
                  'ad6f72f7eec35aef1810c6aaea60b8c047d8be3cdf145663b7a5644ba8d5de74'),
          outAmount: 1000000,
          blindingKey:
              'ad6f72f7eec35aef1810c6aaea60b8c047d8be3cdf145663b7a5644ba8d5de74',
          isTestnet: true,
          btcElectrumUrl: electrumUrl,
          lbtcElectrumUrl: lElectrumUrl,
          boltzUrl: boltzUrl);

      final id = await swap.claim(
          outAddress: lqClaimAddress,
          refundAddress: refundAddress,
          absFee: 3000,
          tryCooperate: true);

      var completer = Completer();
      var receivedEvents = <SwapStreamStatus>[];
      final api = await BoltzApi.newBoltzApi(boltzUrl);
      var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
        try {
          print(event);
          if (event.status == SwapStatus.txnMempool) {
            print('user tx mempool');
          } else if (event.status == SwapStatus.txnConfirmed) {
            print('user tx confirmed');
          } else if (event.status == SwapStatus.txnServerMempool) {
            print('boltz tx mempool');
          } else if (event.status == SwapStatus.txnServerConfirmed) {
            print('boltz tx confirmed');
          } else if (event.status == SwapStatus.txnLockupFailed) {
            final id = await swap.refund(
                refundAddress: refundAddress, absFee: 3000, tryCooperate: true);
            print(id);
          } else if (event.status == SwapStatus.swapError) {
            print('error');
          } else if (event.status == SwapStatus.swapExpired) {
            print('expired');
          }
        } catch (subErr) {
          print(subErr);
        }
      });
      await completer.future;

      await sub.cancel();
    } catch (e) {
      print(e);
    }
  });
}
