class InputValidator {
  static bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isNotEmpty(String value) {
    return value.isNotEmpty;
  }

  static bool isValidNik(String nik) {
    return nik.length >= 16;
  }
}
