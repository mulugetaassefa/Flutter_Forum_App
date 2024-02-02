import 'package:forum/common/commonFunction.dart';
import 'package:forum/pages/loginPage.dart';
import 'package:forum/pages/homePage.dart';
import 'package:forum/constant/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apikey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: "AIzaSyC6VIOV6UkJ92lRgtXo1bMIEDOjaFFLGLg", 
      appId: "1:719910588000:android:686e282601d63c062abd05", 
      messagingSenderId: "719910588000", 
      projectId:"forumflutterapp"
      ));
    
  }

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
      home: _isSignedIn ?  const HomePage() : const LoginPage(),
    );
  }
}