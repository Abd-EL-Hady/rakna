import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:rakna/UI/home_page.dart';
import 'package:rakna/busniss.dart';
import 'package:rakna/Connection/License.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'ui/login_page.dart';
import 'ui/contact_us.dart';

String base_url = 'https://raknah.000webhostapp.com/api/';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Business())],
      child: MyApp(isLogin: true),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({Key? key, required this.isLogin}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(fontFamily: 'cairo'),
      themeMode: ThemeMode.light,
      home: isLogin ? const Homepage() : const LoginPage(),
    );
  }
}
