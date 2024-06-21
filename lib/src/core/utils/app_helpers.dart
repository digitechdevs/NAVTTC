import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:navttc/src/components/prompts.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelpers {
  static Future<void> makePhoneCall(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      appPrint(e.toString());
    }
  }

  static copyToClipboard(value) {
    Clipboard.setData(ClipboardData(text: value)).then(
      (_) => Prompts.showSnackBar("Text copied to clipboard"),
    );
  }

  static Future<XFile?> pick() async {
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> capture({CameraDevice? cameraDevice}) async {
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
  }

  static Future<File?> pickSingleFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'ppt'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        return file;
      } else {
        throw Exception('Failed to pick file');
      }
    } catch (e) {
      Prompts.popMessenger(e.toString());
    }
  }

  static Future<DateTime?> pickDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }

  static Future<TimeOfDay?> pickTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  static Future<void> handleDateTimePicker(
    BuildContext context,
    ValueNotifier<DateTime?> dateNotifier,
    ValueNotifier<TimeOfDay?> timeNotifier,
    bool isDate,
  ) async {
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

  static DateFormat formatter = DateFormat('yyyy-MM-dd');
}
