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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Business>(context, listen: false).getReservation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              background(),
              Consumer<Business>(builder: (context, obj, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    backButton(context),
                    bookHistoryHeader(),
                    if (obj.reservation.isNotEmpty)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          itemCount: obj.reservation.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  '${obj.license.where((element) => obj.reservation[index].licenseId == element.id).first.carModel}'),
                              subtitle: Text(
                                  '${obj.reservation[index].startDate.toString()}'),
                              trailing: Text(
                                  '${obj.reservation[index].endDate.toString()}'),
                            );
                          },
                        ),
                      ),
                  ],
                );
              })
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