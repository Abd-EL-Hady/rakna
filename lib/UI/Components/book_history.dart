import 'package:flutter/material.dart';

Widget bookHistoryHeader() {
  return Stack(
    children: [
      const Image(
        image: AssetImage(
          'images/Home.jpg',
        ),
      ),
      const Positioned(
        left: 100,
        top: 90,
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
        left: 65,
        top: 145,
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
  );
}
