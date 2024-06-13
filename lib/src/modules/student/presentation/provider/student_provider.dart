import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navttc/src/core/utils/app_enums.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/app_helpers.dart';
import 'package:navttc/src/modules/instructor/domain/entities/instructor_option_entity.dart';

final studentProvider = ChangeNotifierProvider.autoDispose((_) => StudentProvider());

class StudentProvider extends ChangeNotifier {

  List<InstructorOptionsEntity> options = [
   
    InstructorOptionsEntity(
      title: 'Attendance ',
      selected: false,
    ),
    InstructorOptionsEntity(
      title: 'Attendance History',
      selected: false,
    ),
  ];

  XFile? pickedFile;
  File? loadedFile;

  pickFile() async {
    pickedFile = await AppHelpers.pick();
    appPrint("***PATH: ${pickedFile!.name}***");
    loadedFile = File(pickedFile!.path);
    appPrint("***PATH: ${loadedFile!.absolute}***");
    notifyListeners();
  }
}
