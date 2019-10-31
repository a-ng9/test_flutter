import 'package:flutter/material.dart';
import 'package:location/location.dart';

// import 'package:test_flutter/location_api.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton.icon(
          icon: Icon(Icons.location_on),
          label: Text("Current Location"),
          onPressed: _getCurrentUserLocation,
        ),
      ],
    );
  }
}
