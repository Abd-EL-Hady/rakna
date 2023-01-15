import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raknah - ركنة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff112B3C),
        body: Center(
            child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to ",
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Raknah ",
                            style: GoogleFonts.cairo(
                                color: Color(0xffF66B0E),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "App ",
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ركنة",
                            style: GoogleFonts.cairo(
                                color: Color(0xffF66B0E),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " مرحبا بك في تطبيق",
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/logo.png"),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What is Raknah ? ",
                              style: GoogleFonts.cairo(
                                  color: Color(0xffF66B0E),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                """Raknah is a smart parking system powered by AI offering users booking parking spaces comfortably by collecting data in real-time and sending it to the user's application""",
                                style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ماهو ركنة ؟",
                                style: GoogleFonts.cairo(
                                    color: Color(0xffF66B0E),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  """ركنة هو نظام مواقف سيارات ذكي يعمل بالذكاء الاصطناعي عن طريق جمع البيانات في الوقت الفعلي ثم ارسالها الى تطبيق المستخدم مماي يسمح له حجز ركنة بسهولة ويسر""",
                                  style: GoogleFonts.cairo(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Soon ",
                                    style: GoogleFonts.cairo(
                                        color: Color(0xffF66B0E),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Available ",
                                    style: GoogleFonts.cairo(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "قريباً ",
                                    style: GoogleFonts.cairo(
                                        color: Color(0xffF66B0E),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "متاح ",
                                    style: GoogleFonts.cairo(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "https://www.facebook.com/profile.php?id=100089112836238"));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset("assets/images/getOnPlay.png"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
