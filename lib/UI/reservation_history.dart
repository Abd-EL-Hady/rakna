import 'package:flutter/material.dart';
import 'package:rakna/UI/Components/book_history.dart';
import 'package:rakna/UI/Components/main_components.dart';
import 'package:provider/provider.dart';

import '../Providers/busniss.dart';

class ReservationHistory extends StatefulWidget {
  const ReservationHistory({Key? key}) : super(key: key);

  @override
  State<ReservationHistory> createState() => _ReservationHistoryState();
}

class _ReservationHistoryState extends State<ReservationHistory> {
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