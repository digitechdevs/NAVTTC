class Validator {
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    Pattern pattern = r'^[a-z A-Z]+$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value) == false) {
    } else {
      return 'Please enter a valid name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-z\-0-9]+\.)+[a-z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    var matches = !regex.hasMatch(value ?? "");

    if (matches) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.startsWith("0")) {
      return "Phone number cannot start with 0";
    } else if (value.length <= 4 || value.length > 15) {
      return 'Phone number must be between 7 to 15 digits';
    }
    return null;
  }

  static String? validatePass(value) {
    if (value.length <= 0) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must not be less than 6 characters';
    }
    return null;
  }
}
