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
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: obj.reservation[index].status == 1
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(children: [
                                Text(
                                    'اسم السيارة: '
                                    '${obj.license.where((element) => obj.reservation[index].licenseId == element.id).first.carName}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    'تاريخ الحجز: '
                                    '${obj.reservation[index].startDate.toString()}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                                Text(
                                  'المكان: ${obj.garageHolders.where((element) => obj.reservation[index].garageHolderId == element.garageHolderId).first.desription}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                    'الوقت: '
                                    '${obj.reservation[index].hours.toString()}'
                                    " ساعة ",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                                Text(
                                    'السعر: '
                                    '${obj.reservation[index].price.toString()}'
                                    " جنية ",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                                Text(
                                    'الحالة: '
                                    '${obj.reservation[index].status == 1 ? "في انتظار الوصول" : "تم الوصول"}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                              ]),
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