import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

Widget background() {
  return const Image(
    image: AssetImage(
      'images/bg.jpg',
    ),
    fit: BoxFit.cover,
  );
}
