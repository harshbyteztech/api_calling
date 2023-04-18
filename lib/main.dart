// import 'package:api_calling/Screen/Login_Screen.dart';
// import 'package:api_calling/Screen/Model_DataGet_By_http.dart';
// import 'package:api_calling/Screen/User_DataGet_By_dio.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import 'Screen/faceBook_authentication.dart';
//
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// // runApp(
// //     DevicePreview(
// //       enabled: !kReleaseMode,
// //       builder: (context) => MyApp(), // Wrap your app
// //     ));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Aping Calling',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Loginscreen(),
//     );
//   }
// }
//
//
//
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'Screen/User_DataGet_By_dio.dart';
import 'Screen/pray_Data_get_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: User_Data(),
    );
  }
}