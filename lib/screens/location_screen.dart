import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'package:test_flutter/location_api.dart';
import 'package:test_flutter/screens/googleMaps_screen.dart';
// import 'package:test_flutter/models/place.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageURL = LocationAPI.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageURL;
    });
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => GoogleMapsScreen(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    //..
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
              height: 450,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: _previewImageUrl == null
                  ? Text(
                      'No Location Chosen',
                      textAlign: TextAlign.center,
                    )
                  : Image.network(_previewImageUrl,
                      fit: BoxFit.cover, width: double.infinity)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.location_on),
                label: Text("Current Location"),
                onPressed: _getCurrentUserLocation,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.map),
                label: Text("Open Google Maps"),
                onPressed: _selectOnMap,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "NOTE: When opening google maps, it will direct you to a specific location (coordinated from code)",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
