import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:rakna/Providers/reservation_provider.dart';
import 'package:rakna/UI/home_page.dart';
import 'package:rakna/Providers/busniss.dart';
import 'package:rakna/Connection/License.dart';
import 'package:rakna/UI/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
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
      providers: [
        ChangeNotifierProvider(create: (context) => Business()),
        ChangeNotifierProvider(create: (context) => ReservationProvider())
      ],
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
      theme: ThemeData(
          fontFamily: 'cairo',
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 16, color: Colors.white),
            bodyText2: TextStyle(fontSize: 16, color: Colors.white),
            headline1: TextStyle(fontSize: 16, color: Colors.white),
            headline2: TextStyle(fontSize: 16, color: Colors.white),
            headline3: TextStyle(fontSize: 16, color: Colors.white),
            headline4: TextStyle(fontSize: 16, color: Colors.white),
            headline5: TextStyle(fontSize: 16, color: Colors.white),
            headline6: TextStyle(fontSize: 16, color: Colors.white),
            subtitle1: TextStyle(fontSize: 16, color: Colors.white),
            subtitle2: TextStyle(fontSize: 16, color: Colors.white),
            caption: TextStyle(fontSize: 16, color: Colors.white),
            overline: TextStyle(fontSize: 16),
            button: TextStyle(fontSize: 16),
          )),
      themeMode: ThemeMode.light,
      home: isLogin ? const LoginPage() : const Homepage(),
    );
  }
}
