import 'package:flutter/material.dart';
import 'package:test_flutter/screens/connectivity.dart';

import 'package:test_flutter/screens/camera.dart';
import 'package:test_flutter/screens/local_notification.dart';
import 'package:test_flutter/screens/location_screen.dart';
import 'package:test_flutter/widgets/location_input.dart';
import 'package:test_flutter/providers/location_provider.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MapLocation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Testing Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.camera_alt),
                label: Text("Camera"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CameraScreen()));
                },
              ),
              RaisedButton.icon(
                icon: Icon(Icons.wifi_tethering),
                label: Text("Connectivity"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InternetConnectivity()));
                },
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocalNotification()));
                },
                icon: Icon(Icons.notifications),
                label: Text("Local Notification"),
              ),
              //Gives the latitude and longitude coordinates in the debug console
              LocationInput(),
              ////////////////////////////////////////////////////////////////////
              RaisedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationScreen()));
                },
                icon: Icon(Icons.map),
                label: Text("Google Maps"),
              )
            ],
          ),
        ));
  }
}
