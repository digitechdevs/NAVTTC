import 'package:flutter/services.dart';

class NoSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Check if the new value contains any spaces
    if (newValue.text.contains(' ')) {
      // If it does, return the old value
      return oldValue;
    }
    // Otherwise, return the new value
    return newValue;
  }
}

class NumberValidator extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String extractedText = extractNumbers(newValue.text);
    return TextEditingValue(
      text: extractedText,
      selection: TextSelection.collapsed(offset: extractedText.length),
    );
  }
}

String extractNumbers(String str) {
  String result = '';
  for (int i = 0; i < str.length; i++) {
    if (str[i].contains(RegExp(r'[0-9]'))) {
      result += str[i];
    }
  }
  return result;
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: smallerAllWordsInFullSentence(newValue.text),
      // text: capitalizeAllWordsInFullSentence(newValue.text),
      selection: newValue.selection,
    );
  }
}

String smallerAllWordsInFullSentence(String str) {
  int i;
  String constructedString = "";
  for (i = 0; i < str.length; i++) {
    if (i == 0) {
      constructedString += str[0].toLowerCase();
    } else if (str[i - 1] == ' ') {
      // mandatory to have index>1 !
      constructedString += str[i].toLowerCase();
    } else {
      constructedString += str[i];
    }
  }
  // appPrint('constructed: $constructedString');
  return constructedString;
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalizeAllWordsInFullSentence(newValue.text),
      // text: capitalizeAllWordsInFullSentence(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalizeAllWordsInFullSentence(String str) {
  int i;
  String constructedString = "";
  for (i = 0; i < str.length; i++) {
    if (i == 0) {
      constructedString += str[0].toUpperCase();
    } else if (str[i - 1] == ' ') {
      // mandatory to have index>1 !
      constructedString += str[i].toUpperCase();
    } else {
      constructedString += str[i];
    }
  }
  // appPrint('constructed: $constructedString');
  return constructedString;
}
