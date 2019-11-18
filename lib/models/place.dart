// import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:location/location.dart';

// import 'package:test_flutter/location_api.dart';

// Future<void> _getCurrentUserLocation() async {
//   final locData = await Location().getLocation();
//    final staticMapImageURL = LocationAPI.generateLocationPreviewImage(
//      latitude: locData.latitude,
//      longitude: locData.longitude,
//    );
// }

class PlaceLocation {
  final double latitude;
  final double londgitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.londgitude,
    this.address,
  });
}
