import 'package:flutter/material.dart';

Future<DateTime?> pickDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
}

Future<TimeOfDay?> pickTime(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
}
Future<void> handleDateTimePicker(BuildContext context, ValueNotifier<DateTime?> dateNotifier, ValueNotifier<TimeOfDay?> timeNotifier, bool isDate) async {
    if (isDate) {
      final pickedDate = await pickDate(context);
      if (pickedDate != null) {
        dateNotifier.value = pickedDate;
      }
    } else {
      final pickedTime = await pickTime(context);
      if (pickedTime != null) {
        timeNotifier.value = pickedTime;
      }
    }
  }