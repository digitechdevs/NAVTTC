import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/app_prompts.dart';
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

  static Future<XFile?> capture() async {
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.camera);
  }

  static DateFormat formatter = DateFormat('yyyy-MM-dd');
}
