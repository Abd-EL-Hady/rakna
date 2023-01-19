import 'package:flutter/material.dart';

Widget bookHeader() {
  return Stack(
    children: const [
      Image(
        image: AssetImage(
          'images/Home.jpg',
        ),
      ),
      Positioned(
        left: 100,
        top: 85,
        child: Text(
          'إحجز ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
      ),
      Positioned(
        left: 75,
        top: 140,
        child: Text(
          'ركنتك ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
      ),
    ],
  );
}
