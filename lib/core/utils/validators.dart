bool isValidEmail(String value) {
  return RegExp(r"^[\w\-.]+@[\w\-.]+\.[a-zA-Z]{2,}").hasMatch(value);
}

bool isNotEmpty(String value) => value.trim().isNotEmpty;
