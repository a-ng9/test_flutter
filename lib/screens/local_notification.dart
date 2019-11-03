import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification extends StatefulWidget {
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var initSettings = InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);

///////function below is set to work without the button
    setState(() {
      showNotification();
    });
  }

  Future<void> onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Hello"),
              content: Text("$payload"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You have to press the button to activate the notification"),
              RaisedButton(
                onPressed: () {
                  // showNotification();
                },
                child: Text("Tap to trigger your setup"),
              ),
              SizedBox(height: 20),
              Text(
                  "NOTE: Please put the desired time you want the notification to ring in the code"),
            ],
          ),
        ),
      ),
    );
  }

  String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }

  showNotification() async {
    //input your time you want the notification to go off
    //time works in 24hours format
    var time = Time(16, 15, 00);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'show daily title',
        'Daily notification shown at approximately ${_toTwoDigitString(time.hour)}:${_toTwoDigitString(time.minute)}:${_toTwoDigitString(time.second)}',
        time,
        platformChannelSpecifics,
        payload: "Welcome back");
  }
}
