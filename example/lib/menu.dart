import 'dart:io';
import 'boltz.dart';

class Menu {
  void displayMenu() async {
    var isRunning = true;

    while (isRunning) {
      print('--------------------');
      print('Choose an operation: (PENDING)');
      print('1. Create submarine swap (PENDING)');
      print('2. Create reverse submarine swap (PENDING)');
      print('3. Check swap status (PENDING)');
      print('4. Check balance (PENDING)');
      print('5. Setup custom wallet (PENDING)');
      print('6. Exit');

      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await createSubmarineSwap();
          break;
        case '2':
          await createReverseSubmarineSwap();
          break;
        case '3':
          await checkSwapStatus();
          break;
        case '4':
          await checkWalletBalance();
          break;
        case '5':
          await setupCustomWallet();
          break;
        case '6':
          print('Exiting...');
          isRunning = false;
          break;
        default:
          print('Invalid choice, please select a valid operation.');
      }
    }
  }
}
