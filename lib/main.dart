import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna/busniss.dart';
import 'package:rakna/connection.dart';

import 'ui/login_page.dart';

void main() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  firebaseMessaging.getToken();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Business()..getLicense()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
