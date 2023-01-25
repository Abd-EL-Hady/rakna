import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rakna/Providers/reservation_provider.dart';
import 'package:rakna/UI/Components/book.dart';
import 'package:rakna/UI/Components/main_components.dart';
import 'package:rakna/UI/reservation_page_1.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(dateTime.toString().split(' ')[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                )),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white30,
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 200,
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: CupertinoDatePicker(
                                                      mode:
                                                          CupertinoDatePickerMode
                                                              .date,
                                                      initialDateTime:
                                                          current.add(
                                                        const Duration(days: 1),
                                                      ),
                                                      maximumDate: current.add(
                                                        const Duration(days: 7),
                                                      ),
                                                      minimumDate: current,
                                                      maximumYear: 2023,
                                                      minimumYear: 2023,
                                                      onDateTimeChanged:
                                                          (DateTime value) {
                                                        setState(() {
                                                          dateTime = DateTime(
                                                            value.year,
                                                            value.month,
                                                            value.day,
                                                            dateTime.hour,
                                                          );
                                                        });
                                                      }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'اختيار التاريخ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            'اختار المكان المناسب ',
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
                          ),
                          child: ListView.builder(
                            itemCount: obj.garageHolders.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: obj.garageHolders[index] ==
                                              obj.selectedGarageHolder
                                          ? Colors.white30
                                          : null,
                                    ),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                              obj.garageHolders[index].city!,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 100,
                                          child: GoogleMap(
                                            mapType: MapType.normal,
                                            initialCameraPosition:
                                                CameraPosition(
                                              target: LatLng(
                                                obj.garageHolders[index]
                                                    .latitude!,
                                                obj.garageHolders[index]
                                                    .longitude!,
                                              ),
                                              zoom: 14.5,
                                            ),
                                            markers: Set<Marker>.of(
                                              <Marker>[
                                                Marker(
                                                  markerId: MarkerId(
                                                    obj.garageHolders[index]
                                                        .latitude!
                                                        .toString(),
                                                  ),
                                                  position: LatLng(
                                                    obj.garageHolders[index]
                                                        .latitude!,
                                                    obj.garageHolders[index]
                                                        .longitude!,
                                                  ),
                                                  infoWindow: InfoWindow(
                                                    title: obj
                                                        .garageHolders[index]
                                                        .name!,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              obj.garageHolders[index]
                                                  .desription!,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.orange,
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    obj.toggleGarageHolder(
                                        obj.garageHolders[index]);
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
                                  obj.getAvilableTimes(
                                      date: DateTime(dateTime.year,
                                          dateTime.month, dateTime.day),
                                      garageHolder: 1);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ReservationPage_ChooseTime(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'عرض الاوقات المتاحة',
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
