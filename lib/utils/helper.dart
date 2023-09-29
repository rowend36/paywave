import 'dart:math';

String generateRandomPin() {
  Random random = Random();
  int pin =
      random.nextInt(10000); // Generate a random number between 0 and 9999
  return pin.toString().padLeft(
      4, '0'); // Convert to string and pad with leading zeros if needed
}
