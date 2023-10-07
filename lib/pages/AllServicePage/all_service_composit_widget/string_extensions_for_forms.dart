extension FormValueCheck on String? {
  // null or empty check
  bool isNullOrEmpty() {
    String value = this ?? '';
    return value.trim().isEmpty;
  }

  // Name Validator

  bool isValidName() {
    if (!(isNullOrEmpty())) {
      String value = this!;
      return value.codeUnits.every((element) =>
          element >= 65 && element <= 90 ||
          element >= 97 && element <= 122 ||
          value.codeUnits.any((element) => element == 32));
    } else {
      return false;
    }
  }
}
