import 'dart:math' show Random;

const String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final Random random = Random.secure();

String getRandomStr(int length) {
  return String.fromCharCodes(
    Iterable.generate(length, (_) {
      return chars.codeUnitAt(random.nextInt(chars.length));
    })
  );
}