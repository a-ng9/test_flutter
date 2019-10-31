import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/location_input.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[SizedBox(height: 30), LocationInput()],
        ),
      ),
    );
  }
}
