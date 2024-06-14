import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:navttc/src/core/entities/fencing_entity.dart';
import 'package:navttc/src/core/entities/latlng_entity.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
///
///

class LocationService {
  final LatLngEntity _officeLocation = const LatLngEntity(
    24.895593,
    67.1162908,
  );

  final double _officeRadius = 100.0;
  double distance = 0.0;
  double? altitudeRounded = 0.0;
  final double _minAltitude = -10.00;
  final double _maxAltitude = -7.00;

  @Deprecated('Should be used only if the location with in 100 meter attendance use case is required')
  Future<FencingEntity> getFencingData() async {
    Position? position = await findUserCurrentLocation();

    bool isInRadius = false;

    distance = Geolocator.distanceBetween(
      position?.latitude ?? 0.0,
      position?.longitude ?? 0.0,
      _officeLocation.latitude,
      _officeLocation.longitude,
    );

    appPrint("***Distance*** $distance");

    altitudeRounded = (position?.altitude ?? 0.0).roundToDouble();

    if ((distance <= _officeRadius)
        // && (altitudeRounded! >= _minAltitude && altitudeRounded! <= _maxAltitude)
        ) {
      appPrint('In Office Premises');
      isInRadius = true;
    } else {
      appPrint('Not In Office Premises');
      isInRadius = false;
    }

    return FencingEntity(position, isInRadius);
  }

  Future<Position?> findUserCurrentLocation() async {
    Position? position;
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      appPrint("Permission $permission");

      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse ||
          permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );

        appPrint("Position Altitude ${position.altitude}");
        appPrint("Rounded Altitude $altitudeRounded");
        appPrint("Position Latitude ${position.latitude}");
        appPrint("Position longitude ${position.longitude}");
        appPrint("Position floor ${position.floor}");
        appPrint("Distance between Office & Current Position $distance");
      } else {
        await Geolocator.openLocationSettings();
        await Geolocator.openAppSettings();
      }
    } on PlatformException catch (e) {
      appPrint("Location getting error $e");
    }
    return position;
  }
}
