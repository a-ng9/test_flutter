// import 'package:location/location.dart';
import 'package:test_flutter/models/place.dart';

// import 'package:test_flutter/location_api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  GoogleMapsScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 37.422, londgitude: -122.084),
      this.isSelecting = false});

//   _getLocation() async {
//     var location = new Location();
//     try {
//      var currentLocation = await location.getLocation();

//       var mapLatitude = currentLocation.latitude;

//       print("locationLatitude: ${currentLocation.latitude}");
//       print("locationLongitude: ${currentLocation.longitude}");
//       // setState(
//       //     () {}); //rebuild the widget after getting the current location of the user
//   } on Exception {}
// }

  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      // body: RaisedButton(
      //   onPressed: () {
      //     _getLocation();
      //   },
      // ),
      body: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation.latitude,
              widget.initialLocation.londgitude,
            ),
            zoom: 16),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _pickedLocation == null
            ? null
            : {
                Marker(
                  markerId: MarkerId('M1'),
                  position: _pickedLocation,
                ),
              },
      ),
    );
  }
}
