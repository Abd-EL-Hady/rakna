import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: const [
                      Image(
                        image: AssetImage(
                          'images/Home.jpg',
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 30,
                        child: Text(
                          'الدعم ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: 'Mada',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 490,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                onChanged: (value) {
                                  //Do something with the user input.
                                },
                                decoration: InputDecoration(
                                  hintText: 'Type your message here...',
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.orange,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                // Add your onPressed code here!
                              },
                              backgroundColor: Colors.orange[600],
                              child: const Icon(Icons.navigation),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
