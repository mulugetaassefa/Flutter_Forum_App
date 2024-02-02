import 'package:flutter/material.dart';
class Constants {
  static String appId ="1:719910588000:web:9186212c0e22b4592abd05";
  static String apikey ="AIzaSyC4h8JW5owGc1TPWV_gfppOxG97SCVXhkE";
  static String messagingSenderId ="719910588000";
  static String projectId ="forumflutterapp";
  final primaryColor =const  Color(0xFFee7b64);
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}