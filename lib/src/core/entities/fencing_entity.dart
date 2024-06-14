import 'package:geolocator/geolocator.dart';

class FencingEntity {
  Position? position;
  bool isWithinRadius;

  FencingEntity(this.position, this.isWithinRadius);
}