import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class InternetConnectivity extends StatefulWidget {
  @override
  _InternetConnectivityState createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Internet connectivity'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Check connectivity'),
                onPressed: _checkInternetConnectivity,
              ),
              Text(
                "This plug-in is not a guaranteed to check internet connection, it mostly checks for network",
                textAlign: TextAlign.center,
              ),
            ],
          )),
        ));
  }

  _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog('No internet', "You are not connected to a network");
    } else if (result == ConnectivityResult.mobile) {
      _showDialog('Internet access', "You are connected over MOBILE DATA");
    } else if (result == ConnectivityResult.wifi) {
      _showDialog('Internet access', "You are connected over WIFI");
    }
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
