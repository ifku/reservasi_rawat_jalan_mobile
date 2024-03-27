import 'dart:math';

extension StringExtensions on String {
  String convertSecondsToMinutesAndSeconds() {
    final seconds = int.parse(this);
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds - (minutes * 60);

    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$remainingSeconds'.padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  String obfuscateLastCharacters(
    int num, {
    String? obscureCharacter,
  }) {
    final visibleLength = max(0, length - num);
    final beginning = substring(0, visibleLength);
    final obscuredWord =
        List.generate(num, (_) => obscureCharacter ?? '*').join();

    return "$beginning$obscuredWord";
  }

  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9._-]+(|\+[a-zA-Z0-9._]+)@[a-zA-Z0-9._-]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool isValidPhoneNumber() {
    return RegExp(
        r'^(?:\+(\d{1,3}))?[-.\s()]?(\d{1,3})[-.\s()]?(\d{1,4})[-.\s()]?(\d{1,9})$')
        .hasMatch(this);
  }
}
