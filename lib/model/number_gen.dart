import 'dart:math';

class NumberGenerator {
  int generateRandomNumber() {
    int randomNumber = Random().nextInt(100);
    return randomNumber;
  }
}
