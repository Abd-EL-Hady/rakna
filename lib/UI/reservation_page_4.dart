import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rakna/Providers/reservation_provider.dart';
import 'package:rakna/UI/Components/book.dart';
import 'package:rakna/UI/Components/main_components.dart';
import 'package:rakna/UI/home_page.dart';
import 'package:rakna/UI/reservation_page_1.dart';

class ReservationPageFinal extends StatefulWidget {
  const ReservationPageFinal({Key? key}) : super(key: key);

  @override
  State<ReservationPageFinal> createState() => _ReservationPageFinalState();
}

class _ReservationPageFinalState extends State<ReservationPageFinal> {
  List<Widget> places = <Widget>[];

  int _selectedRegion = 0;
  bool vertical = false;
  final List<bool> _selectedPlaces = <bool>[];
  late DateTime dateTime;
  int _hours = 1;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime =
        DateTime(current.year, current.month, current.day + 1, current.hour);
  }

  var current = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationProvider>(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (context, obj, _) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: background()),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        backButton(context),
                        bookHeader(),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFF66B0E),
                                  ),
                                ),
                                onPressed: () {
                                  obj.addReservation();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage()),
                                      (route) => false);

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage()),
                                      (route) => false);
                                },
                                child: const Text(
                                  'احجز الان ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
