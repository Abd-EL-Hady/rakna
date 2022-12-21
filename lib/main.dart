import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna/busniss.dart';
import 'package:rakna/Connection/License.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/login_page.dart';
String base_url = 'https://raknah.000webhostapp.com/api/';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Business()..getLicense("id")),
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
