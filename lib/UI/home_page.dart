import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rakna/UI/Components/main_components.dart';
import 'package:rakna/UI/reservation_page.dart';
import 'package:rakna/ui/profile_page.dart';

import 'car_license.dart';
import 'reservation_history.dart';
import 'package:rakna/UI/license_page.dart';
import 'package:rakna/ui/profile_page.dart';
import 'payment_page.dart';
import 'contact_us.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: background(),
            ),
            SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText(
                            ' أهلا',
                            duration: const Duration(seconds: 1),
                            textStyle: const TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo',
                              color: Colors.white,
                            ),
                          ),
                          ScaleAnimatedText(
                            'بيك',
                            duration: const Duration(seconds: 1),
                            textStyle: const TextStyle(
                              fontSize: 32.0,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                        isRepeatingAnimation: true,
                        repeatForever: true,
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
                      'الرئيسة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
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
                                  return states.contains(MaterialState.pressed)
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
                                  return states.contains(MaterialState.pressed)
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
                                    builder: (context) => const Profile_Page()),
                              );
                            },
                            child: const Text(
                              'الملف الشخصي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
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
                              backgroundColor: MaterialStateProperty.all(
                                Colors.orange[600],
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PaymentPage()),
                              );
                            },
                            child: const Text(
                              'ﺇضافة بطاقة',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                                  return states.contains(MaterialState.pressed)
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
                                MaterialPageRoute(builder: (context) => Car()),
                              );
                            },
                            child: const Text(
                              'رخصة القيادة',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(20),
                  //       child: SizedBox(
                  //         height: 100,
                  //         width: 240,
                  //         child: ElevatedButton(
                  //           style: ButtonStyle(
                  //             backgroundColor: MaterialStateProperty.all(
                  //               Colors.orange[600],
                  //             ),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => const Car()),
                  //             );
                  //           },
                  //           child: Text(
                  //             'car license',
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 20,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const Image(
                    image: AssetImage(
                      'images/logo.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
