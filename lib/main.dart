import 'package:demo_app/user_login.dart';
import 'package:flutter/material.dart';

import 'Utility/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'HelveticaLTStd',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 237, 244, 249),
      ),
      home: const UserLogin(),
    );
  }
}
