class Validator {
  static String? validateValue(String? value) {
    if (value!.isEmpty) {
      return 'Please enter some data';
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
    if (value.length != 11) {
      return 'Phone number must be 11 digits.';
    }
  } else if (value.startsWith("92")) {
    if (value.length != 12) {
    
     if(value.contains('920')){
      return 'Third digit cant start with 0';
    }
     return 'Phone number must be 12 digits.';
    }
  } else {
    return 'Phone number should start with 0 or 92';
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
  static String? validateNotEmpty(String? value){
    if(value == null || value.isEmpty){
      return 'This feild must not be empty';
    }
    return null;
  }

  static String? validateCNIC(value) {
    if (value.length <= 0) {
        return 'Please enter your CNIC number';
    }
    else if (value.length < 15) {
       return 'CNIC number must be 13 digits';
}
return null;

  }
 
}
