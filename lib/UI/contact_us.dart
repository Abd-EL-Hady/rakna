import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Connection/Contact.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final firestore =  FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  String? messageText;

  @override

  void getMessages() async {
    await for (var snapshot in firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Stack(
              children: [
                const Image(
                  image: AssetImage(
                    'images/bg.jpg',
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: const [
                        Image(
                          image: AssetImage(
                            'images/Home.jpg',
                          ),
                        ),
                        Positioned(
                          left: 70,
                          top: 140,
                          child: Text(
                            'الدعم ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'Mada',
                            ),
                          ),
                        ),
                      ],
                    ),


                        Container(
                          height: 410,
                            child: MessageStreamBuilder(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                  controller: messageTextController,
                                  style: const TextStyle(color: Colors.white),
                                  onChanged: (value) {
                                    messageText = value;//Do something with the user input.
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
                                      color: Colors.white24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                onPressed: () {
                                  messageTextController.clear();
                                  firestore.collection('messages').add(
                                      {'text': messageText,
                                      'time':FieldValue.serverTimestamp()});
                                },
                                backgroundColor: Colors.orange[600],
                                child: const Icon(Icons.navigate_next),
                              ),
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

