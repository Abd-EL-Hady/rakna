import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestore =  FirebaseFirestore.instance;
    return StreamBuilder<QuerySnapshot>(stream: firestore.collection('messages').orderBy('time').snapshots(),builder: (context,snapshot){
      List<Message> messageWidgets = [];
      if (!snapshot.hasData) {

      }
      final messages = snapshot.data!.docs.reversed;
      for (var message in messages) {
        final messageText = message.get('text');
        final messageWidget = Message(text: messageText,);
        messageWidgets.add(messageWidget);
      }
      return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          reverse: true,
          children: messageWidgets
      );
    }
    );
  }
}


class Message extends StatelessWidget {
  const Message({this.text, Key? key}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text('$text',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
