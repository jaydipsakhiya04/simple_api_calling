import 'package:api_example/Screens/Exercise_Screen.dart';
import 'package:api_example/Screens/Photos_Screen.dart';
import 'package:api_example/Screens/User_Screen.dart';
import 'package:api_example/Screens/all_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Post_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: All_Screen(),
    );
  }
}
