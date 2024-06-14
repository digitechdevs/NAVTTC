import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navttc/src/components/prompts.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/app_helpers.dart';
import 'package:navttc/src/modules/instructor/domain/entities/instructor_option_entity.dart';
import 'package:navttc/src/services/location_service/geofencing.dart';

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
    pickedFile = await AppHelpers.capture();
    print("***PATH: ${pickedFile!.name}***");
    loadedFile = File(pickedFile!.path);
    print("***PATH: ${loadedFile!.absolute}***");
    notifyListeners();
  }

  List<String> buffers = [];
  final String bufferId = 'start';

  Future<void> startClass() async {
    try {
      print("START CLASS");
      buffers.add(bufferId);
      notifyListeners();
      var currentLocation = await LocationService().findUserCurrentLocation();
      print("currentLocation: ${currentLocation?.toJson()}");
      Prompts.popMessenger('Class Started Successfully', isSuccess: true);
    } finally {
      buffers.remove(bufferId);
      notifyListeners();
    }
  }

  Future<void> endClass() async {
    try {
      print("END CLASS");
      buffers.add(bufferId);
      notifyListeners();
      var currentLocation = await LocationService().findUserCurrentLocation();
      print("currentLocation: ${currentLocation?.toJson()}");
      Prompts.popMessenger('Class Ended Successfully', isSuccess: true);
    } finally {
      buffers.remove(bufferId);
      notifyListeners();
    }
  }
}
