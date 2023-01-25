import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rakna/Providers/reservation_provider.dart';
import 'package:rakna/UI/Components/book.dart';
import 'package:rakna/UI/Components/main_components.dart';
import 'package:rakna/UI/reservation_page_2.dart';

class ReservationPage_ChooseTime extends StatefulWidget {
  const ReservationPage_ChooseTime({Key? key}) : super(key: key);

  @override
  State<ReservationPage_ChooseTime> createState() =>
      _ReservationPage_ChooseTimeState();
}

class _ReservationPage_ChooseTimeState
    extends State<ReservationPage_ChooseTime> {
  List<Widget> places = <Widget>[];

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
                        const Center(
                          child: Text(
                            'اختيار الوقت',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 2,
                              color: Colors.orange,
                            ),
                            color: Colors.white12,
                          ),
                          child: ListView.builder(
                            itemCount: obj.avilaibletimes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  obj.avilaibletimes[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                leading: Radio(
                                  activeColor: Colors.orange,
                                  value: index,
                                  groupValue: obj.selectedTime,
                                  onChanged: (int? value) {
                                    setState(() {
                                      obj.selectedTime = value!;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
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
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFF66B0E),
                                  ),
                                ),
                                onPressed: () {
                                  if (obj.selectedTime == -1) {
                                    Fluttertoast.showToast(
                                        msg: "الرجاء اختيار وقت",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    return;
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReservationPage_ChooseLicense()));
                                },
                                child: const Text(
                                  "المتابعة للخطوة التالية",
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
