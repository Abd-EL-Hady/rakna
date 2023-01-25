import 'package:flutter/material.dart';

class Car_license extends StatefulWidget {
  const Car_license({Key? key}) : super(key: key);

  @override
  State<Car_license> createState() => _Car_licenseState();
}

class _Car_licenseState extends State<Car_license> {
  TextEditingController carlicenseController = TextEditingController();
  TextEditingController carlicenseexController = TextEditingController();
  TextEditingController carnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(// رقم الرخصة
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: carlicenseController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال رقم الرخصة';
                    } else if (value.length < 14) {
                      return 'رقم الرخصة غير صحيح';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  cursorRadius: const Radius.circular(25),
                  cursorColor: Colors.orange[600],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: ' رقم الرخصة',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                    fillColor: Colors.white24,
                    filled: true,
                  ),
                ),
              ),
              Padding(// نوع الرخصة
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: carlicenseController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال نوع الرخصة';
                    }
                    return null;
                  },
                  cursorRadius: const Radius.circular(25),
                  cursorColor: Colors.orange[600],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: ' نوع الرخصة',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                    fillColor: Colors.white24,
                    filled: true,
                  ),
                ),
              ),
              Padding( //تاريخ انتهاء الرخصة
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: carlicenseexController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال تاريخ انتهاء الرخصة';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.datetime,
                  cursorRadius: const Radius.circular(25),
                  cursorColor: Colors.orange[600],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: ' تاريخ انتهاء الرخصه',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                    fillColor: Colors.white24,
                    filled: true,
                  ),
                ),
              ),
              Padding(//اسم السيارة
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: carnameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال اسم السيارة ';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'اسم السيارة ',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                  ),
                ),
              ),
              Padding(// موديل السيارة
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'موديل السيارة ',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                  ),
                ),
              ),
              Padding( // نوع السيارة
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'نوع السيارة ',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                  ),
                ),
              ),
              Padding(// لون السيارة
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'لون السيارة ',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                  ),
                ),
              ),
              Row(// صورة الرخصة وجه
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("اختيار الصورة"),
                          content: const Text(
                              "الرجاء ارفاق صورة بطاقة الرخصة (وجه)"),
                          actions: [
                            TextButton(
                                onPressed: () {},
                                child: const Text('الاستديو')),
                            TextButton(
                                onPressed: () {},
                                child: const Text('الكاميرا')),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.orange[600],
                      ),
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'صورة بطاقة الرخصة (وجه)', //الصورة الشخصية
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cairo',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(// صورة الرخصة ظهر
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("اختيار الصورة"),
                          content: const Text(
                              "الرجاء ارفاق صورة بطاقة الرخصة (وجه)"),
                          actions: [
                            TextButton(
                                onPressed: () {},
                                child: const Text('الاستديو')),
                            TextButton(
                                onPressed: () {},
                                child: const Text('الكاميرا')),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.orange[600],
                      ),
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'صورة بطاقة الرخصة(ظهر)', //الصورة الشخصية
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cairo',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Icon(Icons.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
