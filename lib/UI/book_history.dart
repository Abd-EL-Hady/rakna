import 'package:flutter/material.dart';
import 'package:rakna/UI/Components/book_history.dart';
import 'package:rakna/UI/Components/main_components.dart';
import 'package:rakna/busniss.dart';
import 'package:provider/provider.dart';

class book_history extends StatefulWidget {
  const book_history({Key? key}) : super(key: key);

  @override
  State<book_history> createState() => _book_historyState();
}

class _book_historyState extends State<book_history> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              background(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  backButton(context),
                  bookHistoryHeader(),
                  Table(
                    border: TableBorder.all(color: Colors.orange),
                    children: [
                      for (var item
                          in Provider.of<Business>(context, listen: false)
                              .reservation)
                        TableRow(
                            children: [Text('id'), Text(item.id.toString())])
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


// Table(
//                     border: TableBorder.all(color: Colors.orange),
//                     children: [
//                       for (var item
//                           in Provider.of<Business>(context, listen: false)
//                               .reservation)
//                         TableRow(
//                             children: [Text('id'), Text(item.id.toString())])
//                     ],
//                   )