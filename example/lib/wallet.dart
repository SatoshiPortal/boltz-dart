// import 'package:bdk_flutter/bdk_flutter.dart';
// 
// late Wallet wallet;
// late Blockchain blockchain;
// const fundingWalletMnemonic = 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial';
// 
// Future<Blockchain> setupBlockchain() async {
//   blockchain = await Blockchain.create(
//       config: BlockchainConfig.electrum(
//           config: ElectrumConfig(
//               stopGap: 10, timeout: 5, retry: 5, url: "ssl://electrum.blockstream.info:60002", validateDomain: true)));
//   return blockchain;
// }
// 
// Future<Wallet> setupWallet(Blockchain blockchain) async {
//   final mnemonic = await Mnemonic.fromString(fundingWalletMnemonic);
//   final descriptorSecretKey = await DescriptorSecretKey.create(network: Network.Testnet, mnemonic: mnemonic);
//   final externalDescriptor = await Descriptor.newBip84(
//       secretKey: descriptorSecretKey, network: Network.Testnet, keychain: KeychainKind.External);
//   final internalDescriptor = await Descriptor.newBip84(
//       secretKey: descriptorSecretKey, network: Network.Testnet, keychain: KeychainKind.Internal);
// 
//   final wallet = await Wallet.create(
//       descriptor: externalDescriptor,
//       changeDescriptor: internalDescriptor,
//       network: Network.Testnet,
//       databaseConfig: const DatabaseConfig.memory());
//   final _ = await wallet.sync(blockchain);
// 
//   return wallet;
// }
