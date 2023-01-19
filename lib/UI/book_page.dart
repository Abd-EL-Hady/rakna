import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rakna/Providers/book_provider.dart';
import 'package:rakna/UI/Components/book.dart';
import 'package:rakna/UI/Components/main_components.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  List<Widget> places = <Widget>[];

  int _selectedRegion = 0;
  bool vertical = false;
  final List<bool> _selectedPlaces = <bool>[];
  late DateTime dateTime;
  int _hours = 1;

  // final List<String> _region = <String>[
  //   // 'الإسكندرية',
  //   // 'الإسماعيلية',
  //   // 'أسوان',
  //   // 'أسيوط',
  //   // 'الأقصر',
  //   // 'البحر الأحمر',
  //   // 'البحيرة',
  //   // 'بني سويف',
  //   // 'بورسعيد',
  //   // 'جنوب سيناء',
  //   // 'الجيزة',
  //   'الدقهلية',
  //   // 'دمياط',
  //   // 'سوهاج',
  //   // 'السويس',
  //   // 'الشرقية',
  //   // 'شمال سيناء',
  //   // 'الغربية',
  //   // 'الفيوم',
  //   'القاهرة',
  //   // 'القليوبية',
  //   // 'قنا',
  //   // 'كفر الشيخ',
  //   // 'مطروح',
  //   // 'المنيا',
  //   // 'المنوفية',
  //   // 'الوادي الجديد',
  // ];

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
    return Consumer<BookProvider>(
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
                            Text(
                                dateTime.toString().split(' ')[0] +
                                    '   ' +
                                    (dateTime.hour > 12
                                        ? (dateTime.hour - 12).toString() +
                                            ':00' +
                                            ' PM'
                                        : dateTime.hour.toString() +
                                            ':00' +
                                            ' AM'),
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
                                                  child: CupertinoPicker(
                                                    itemExtent: 32,
                                                    onSelectedItemChanged:
                                                        (int index) {
                                                      setState(() {
                                                        dateTime = DateTime(
                                                          dateTime.year,
                                                          dateTime.month,
                                                          dateTime.day,
                                                          index,
                                                        );
                                                      });
                                                    },
                                                    children: [
                                                      for (int i =
                                                              current.hour + 1;
                                                          i <= 24;
                                                          i++,)
                                                        Text(i.toString()),
                                                    ],
                                                  ),
                                                ),
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
                                    'اختيار الوقت',
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        decoration: BoxDecoration(
                                            color: Colors.orange[600],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(children: <Widget>[
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                if (_hours < 24) {
                                                  _hours += 1;
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'لا يمكن اختيار اكثر من 24 ساعة',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              });
                                            },
                                          ),
                                          Text(_hours.toString(),
                                              style: const TextStyle(
                                                  fontSize: 22)),
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              setState(() {
                                                if (_hours > 1) {
                                                  _hours -= 1;
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'لا يمكن اختيار اقل من ساعة',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              });
                                            },
                                          ),
                                        ])),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '  عدد الساعات',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  // Display a CupertinoPicker with list of fruits.
                                  onPressed: () => _showDialog(
                                    CupertinoPicker(
                                      magnification: 1.22,
                                      squeeze: 1.2,
                                      useMagnifier: true,
                                      itemExtent: 32,
                                      // This is called when selected item is changed.
                                      onSelectedItemChanged:
                                          (int selectedItem) {
                                        setState(
                                          () {
                                            _selectedRegion = selectedItem;
                                          },
                                        );
                                      },
                                      children: List<Widget>.generate(
                                        obj.governments.length,
                                        (int index) {
                                          return Center(
                                            child: Text(
                                              obj.governments[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // This displays the selected fruit name.
                                  child: Text(
                                    obj.governments[_selectedRegion],
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.orange[600],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  ' : اختار المحافظة  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 2,
                              color: Colors.orange,
                            ),
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleButtons(
                                        direction: vertical
                                            ? Axis.vertical
                                            : Axis.vertical,
                                        onPressed: (int index) {
                                          setState(() {
                                            // The button that is tapped is set to true, and the others to false.
                                            for (int i = 0;
                                                i < _selectedPlaces.length;
                                                i++) {
                                              _selectedPlaces[i] = i == index;
                                            }
                                          });
                                        },
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        selectedBorderColor: Colors.orange[600],
                                        selectedColor: Colors.white,
                                        fillColor: Colors.orange[600],
                                        color: Colors.white,
                                        constraints: const BoxConstraints(
                                          minHeight: 40.0,
                                          minWidth: 100.0,
                                        ),
                                        isSelected: _selectedPlaces,
                                        children: places,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 60,
                            width: 130,
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
                                onPressed: () {},
                                child: const Text(
                                  'حجز',
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
