import "package:flutter/material.dart";
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = imageFile;
    });
  }

  Future<void> _galleryPicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              // color: Colors.blue,
            ),
            child: _storedImage != null
                ? Image.file(
                    _storedImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Text(
                    "No Image Taken",
                    textAlign: TextAlign.center,
                  ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              // color: Colors.red,
              child: FlatButton.icon(
            icon: Icon(Icons.camera_alt),
            label: Text("Take Picture"),
            textColor: Colors.blue,
            onPressed: _takePicture,
          )),
          Container(
              // color: Colors.yellow,
              child: FlatButton.icon(
            icon: Icon(Icons.image),
            label: Text("Select Picture"),
            textColor: Colors.blue,
            onPressed: _galleryPicture,
          )),
        ],
      ),
    );
  }
}
