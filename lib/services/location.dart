import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double? latitude;
  double? longitude;
  Future<void> getCurrentPosition() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      // TODO: make variable that cheks if user already granted permission
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

}