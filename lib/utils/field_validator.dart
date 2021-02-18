class FieldValidator {
  static String validateEmail(String value) {
    const String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    final RegExp regExp = RegExp(pattern);

    if (value.isEmpty) return "Email field cannot be empty";

    if (!regExp.hasMatch(value)) {
      return "Enter Valid Email!";
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) return "Password cannot be empty";

    if (value.length < 8) {
      return "Password cannot be less than eight characters";
    }
    return null;
  }

  static String validateText(String value) {
    if (value.isEmpty) return "Field cannot be empty";

    return null;
  }
}
