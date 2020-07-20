import 'package:flutter/material.dart';
import 'package:lmao/pages/activity.dart';
import 'package:lmao/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isLogged = (sharedPreferences.getBool('isLogged') ?? false);

  sharedPreferences.setString("url", "https://b01bb30b6b80.ngrok.io/");

  var home;
  if (isLogged) {
    home = Activity();
    
  } else {
    home = Login();
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){runApp(MaterialApp(
    home: home,
    routes: {
      '/login': (context) => Login(),
      '/activity': (context) => Activity(),
    },
  ));});
}
