class ValidateFeild {
  bool isValidatePassword(String arg) {
    if (arg.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  bool isEmailValid(String email) {
    bool validEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return validEmail;
  }

  bool isValidatePhone(arg) {
    bool validPhone = RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(arg);
    if (!validPhone) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidateName(String arg) {
    if (arg.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidateID(String id) {
    if (id.length == 12) {
      return true;
    } else {
      return false;
    }
  }
}
