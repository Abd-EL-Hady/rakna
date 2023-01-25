import 'package:flutter/material.dart';
import 'package:rakna/UI/add_car_license.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  final List carlicense = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  itemCount: carlicense.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${carlicense[index]}'),
                    );
                  },
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Car_license()),
                        );
                      },
                      child: const Text('إضافة رخصة جديدة'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
