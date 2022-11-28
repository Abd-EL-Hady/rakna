import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  final List<Widget> places_1 = <Widget>[
    const Text('place 1 '),
    const Text('place 2 '),
    const Text('place 3 '),
    const Text('place 4 '),
    const Text('place 5 '),
    const Text('place 6 '),
    const Text('place 7 '),
    const Text('place 8 '),
  ];

  int _selectedRegion = 0;
  bool vertical = false;
  final List<bool> _selectedPlaces = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  final List<String> _region = <String>[
    'الإسكندرية',
    'الإسماعيلية',
    'أسوان',
    'أسيوط',
    'الأقصر',
    'البحر الأحمر',
    'البحيرة',
    'بني سويف',
    'بورسعيد',
    'جنوب سيناء',
    'الجيزة',
    'الدقهلية',
    'دمياط',
    'سوهاج',
    'السويس',
    'الشرقية',
    'شمال سيناء',
    'الغربية',
    'الفيوم',
    'القاهرة',
    'القليوبية',
    'قنا',
    'كفر الشيخ',
    'مطروح',
    'المنيا',
    'المنوفية',
    'الوادي الجديد',
  ];

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
  Widget build(BuildContext context) {
    var current = DateTime.now();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Image(
                image: AssetImage(
                  'images/bg.jpg',
                ),
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      const Image(
                        image: AssetImage(
                          'images/Home.jpg',
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 10,
                        child: Text(
                          'إحجز ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: 'Mada',
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 70,
                        child: RichText(
                          text: const TextSpan(
                            text: 'ركنتك ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontFamily: 'Mada',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'إمتي ؟',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Mada',
                    ),
                  ),
                  TextButton(
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
                                        onSelectedItemChanged: (int index) {},
                                        children: const [
                                          Text(
                                            'AM',
                                          ),
                                          Text(
                                            'PM',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: CupertinoPicker(
                                        itemExtent: 32,
                                        onSelectedItemChanged: (int index) {},
                                        children: [
                                          for (int i = current.hour + 1;
                                              i <= 24;
                                              i++,)
                                            Text(i > 12
                                                ? (i - 12).toString()
                                                : i.toString()),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: current.add(
                                          const Duration(days: 1),
                                        ),
                                        maximumDate: current.add(
                                          const Duration(days: 7),
                                        ),
                                        minimumDate: current,
                                        maximumYear: 2022,
                                        minimumYear: 2022,
                                        onDateTimeChanged: (DateTime value) {},
                                      ),
                                    ),
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
                          fontFamily: 'Mada',
                        ),
                      ),
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
                                onSelectedItemChanged: (int selectedItem) {
                                  setState(
                                    () {
                                      _selectedRegion = selectedItem;
                                    },
                                  );
                                },
                                children: List<Widget>.generate(
                                  _region.length,
                                  (int index) {
                                    return Center(
                                      child: Text(
                                        _region[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            // This displays the selected fruit name.
                            child: Text(
                              _region[_selectedRegion],
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
                              fontFamily: 'Mada',
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
                        fontFamily: 'Mada',
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
                                  direction:
                                      vertical ? Axis.vertical : Axis.vertical,
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
                                  children: places_1,
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
                              fontFamily: 'Mada',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
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
