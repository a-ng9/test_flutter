import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'package:test_flutter/location_api.dart';

class LocationGoogleMaps extends StatefulWidget {
  @override
  _LocationGoogleMapsState createState() => _LocationGoogleMapsState();
}

class _LocationGoogleMapsState extends State<LocationGoogleMaps> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          RaisedButton.icon(
            icon: Icon(Icons.location_on),
            label: Text("Current Location"),
            onPressed: _getCurrentUserLocation,
          ),
        ],
      ),
    );
  }
}
