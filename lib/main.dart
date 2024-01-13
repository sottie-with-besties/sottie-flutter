import 'dart:io';

import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.white,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(color: Colors.black))),
        home: LoginPage());
  }
}
