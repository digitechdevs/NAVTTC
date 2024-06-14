import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navttc/src/core/utils/app_enums.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/app_helpers.dart';
import 'package:navttc/src/modules/instructor/domain/entities/instructor_option_entity.dart';

final instructorProvider = ChangeNotifierProvider.autoDispose((_) => InstructorProvider());

class InstructorProvider extends ChangeNotifier {

  List<InstructorOptionsEntity> options = [
    InstructorOptionsEntity(
      title: 'Instructor Details',
      selected: true,
    ),
    InstructorOptionsEntity(
      title: 'Attendance Details',
      selected: false,
    ),
    InstructorOptionsEntity(
      title: 'Attendance History',
      selected: false,
    ),
  ];
  XFile? pickedClassPicture;
  File? loadedClassPicture;

  pickClassPicture() async {
    pickedClassPicture = await AppHelpers.capture();
    print("***PATH: ${pickedClassPicture!.name}***");
    loadedClassPicture = File(pickedClassPicture!.path);
    print("***PATH: ${loadedClassPicture!.absolute}***");
    notifyListeners();
  }
}
