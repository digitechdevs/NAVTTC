import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navttc/src/components/prompts.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/app_helpers.dart';
import 'package:navttc/src/modules/instructor/domain/entities/instructor_option_entity.dart';
import 'package:navttc/src/services/location_service/geofencing.dart';

final instituteProvider =
    ChangeNotifierProvider.autoDispose((_) => InstituteProvider());

class InstituteProvider extends ChangeNotifier {
  List<InstructorOptionsEntity> options = [
    InstructorOptionsEntity(
      title: 'Institute Details',
      selected: true,
    ),
    InstructorOptionsEntity(
      title: 'Institute profile',
      selected: false,
    ),
    InstructorOptionsEntity(
      title: 'Allied/Other Facilities',
      selected: false,
    ),
    InstructorOptionsEntity(
      title: 'Trade',
      selected: false,
    ),
    InstructorOptionsEntity(
      title: 'Add/Edit Details',
      selected: false,
    ),
  ];

  XFile? pickedClassPicture;
  File? loadedClassPicture;

  captureClassPicture() async {
    pickedClassPicture = await AppHelpers.capture();
    print("***PATH: ${pickedClassPicture!.name}***");
    loadedClassPicture = File(pickedClassPicture!.path);
    print("***PATH: ${loadedClassPicture!.absolute}***");
    notifyListeners();
  }

  XFile? pickedInstructorSelfie;
  File? loadedInstructorSelfie;

  captureInstructorSelfie() async {
    pickedInstructorSelfie = await AppHelpers.capture();
    print("***PATH: ${pickedInstructorSelfie!.name}***");
    loadedInstructorSelfie = File(pickedInstructorSelfie!.path);
    print("***PATH: ${loadedClassPicture!.absolute}***");
    notifyListeners();
  }

  ///
  /// Instructor Details
  ///

  XFile? pickedImageOne;
  File? loadedImageOne;

  captureImageOne() async {
    pickedImageOne = await AppHelpers.capture(cameraDevice: CameraDevice.rear);
    print("***PATH: ${pickedImageOne!.name}***");
    loadedImageOne = File(pickedImageOne!.path);
    print("***PATH: ${loadedImageOne!.absolute}***");
    notifyListeners();
  }

  XFile? pickedImageTwo;
  File? loadedImageTwo;

  captureImageTwo() async {
    pickedImageTwo = await AppHelpers.capture(cameraDevice: CameraDevice.front);
    print("***PATH: ${pickedImageTwo!.name}***");
    loadedImageTwo = File(pickedImageTwo!.path);
    print("***PATH: ${loadedImageTwo!.absolute}***");
    notifyListeners();
  }

  var resumePath = TextEditingController();

  Future<void> pickResume() async {
    var resume = await AppHelpers.pickSingleFile();
    resumePath.text = resume?.parent.path ?? "Resume Upload";
    notifyListeners();
  }

  void clearInstructorDetails() {
    print("CLEAR INSTRUCTOR");
    resumePath.clear();
    pickedImageOne = null;
    pickedImageTwo = null;
    pickedClassPicture = null;
    pickedInstructorSelfie = null;
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
