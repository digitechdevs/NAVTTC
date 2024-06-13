import 'package:image_picker/image_picker.dart';

class Pickers {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> upload() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> capture() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }
}
