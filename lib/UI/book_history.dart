import 'package:flutter/material.dart';

class book_history extends StatefulWidget {
  const book_history({Key? key}) : super(key: key);

  @override
  State<book_history> createState() => _book_historyState();
}

class _book_historyState extends State<book_history> {
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
                Stack(
                  children: [
                    const Image(
                      image: AssetImage(
                        'images/Home.jpg',
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      top: 40,
                      child: Text(
                        'سجل ',
                        style: TextStyle(
                          fontFamily: 'Mada',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 100,
                      child: RichText(
                        text: const TextSpan(
                          text: " ركناتك ",
                          style: TextStyle(
                            fontFamily: 'Mada',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
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