import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navttc/src/core/utils/app_enums.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

final authProvider = ChangeNotifierProvider.autoDispose((_) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  String selectedRole = Role.Instructor.name;

  bool checked = false;

  get image => null;

  get pickedFile => null;

  get loadedFile => null;

  void onCheck() {
    checked = !checked;
    notifyListeners();
  }

  bool isObscure = true;

  void onObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void onRoleChanged(String? value) {
    selectedRole = value ?? Role.Institute.name;
    notifyListeners();
  }
}
