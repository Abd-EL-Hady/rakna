import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rakna/UI/contact_us.dart';
import 'package:rakna/UI/reservation_history.dart';
import 'package:rakna/UI/reservation_page.dart';
import 'package:rakna/ui/profile_page.dart';

class Do extends StatefulWidget {
  const Do({Key? key}) : super(key: key);

  @override
  State<Do> createState() => _DoState();
}

class _DoState extends State<Do> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const Image(
                  image: AssetImage(
                    'images/bg.jpg',
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              ' أهلا',
                              duration: const Duration(seconds: 1),
                              textStyle: const TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Mada',
                                color: Colors.white,
                              ),
                            ),
                            ScaleAnimatedText(
                              'بيك',
                              duration: const Duration(seconds: 1),
                              textStyle: const TextStyle(
                                fontSize: 32.0,
                                fontFamily: 'Mada',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.orange[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'اختار حابب تعمل إية ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Mada',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.orange[600],
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReservationPage()),
                                );
                              },
                              child: const Text(
                                'إحجز ركنتك',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Mada',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return states
                                            .contains(MaterialState.pressed)
                                        ? Colors.orange[600]
                                        : null;
                                  },
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReservationHistory()),
                                );
                              },
                              child: const Text(
                                'سجل ركناتك',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Mada',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return states
                                            .contains(MaterialState.pressed)
                                        ? Colors.orange[600]
                                        : null;
                                  },
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Profile_Page()),
                                );
                              },
                              child: const Text(
                                'الملف الشخصي',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Mada',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.orange[600],
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Contact()),
                                );
                              },
                              child: const Text(
                                'تواصل معنا',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Mada',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Image(
                      image: AssetImage(
                        'images/logo.jpg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
