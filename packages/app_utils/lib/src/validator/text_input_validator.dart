class TextInputValidator {
  String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailRegExp.hasMatch(value)) {
      return "Please enter a valid email";
    }

    return null;
  }

  String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    return null;
  }

  String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    if (password != value) {
      return "Passwords do not match";
    }

    return null;
  }

  String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    if (value.length != 10) {
      return "Please enter a valid 10-digit phone number";
    }

    return null;
  }

  String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    return null;
  }

  String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    } else if (value.length > 50) {
      return "Name is too long";
    }

    return null;
  }
}
