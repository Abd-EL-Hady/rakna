import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna/Providers/busniss.dart';
import 'package:rakna/UI/Components/main_components.dart';

import 'license_page.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  final List carlicense = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: background()),
            Consumer<Business>(builder: (context, obj, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(context),
                  if (obj.license.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                        itemCount: obj.license.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(obj.license[index].carName!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      )),
                                ),
                                Center(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      obj.license[index].carType!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      obj.license[index].carModel!,
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
                          );
                        },
                      ),
                    ),
                  if (obj.license.isEmpty)
                    Center(
                      child: TextButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LicensesPage()),
                              ),
                          child: Column(
                            children: const [
                              Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text('لا يوجد رخص مسجلة',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              Text('اضغط هنا لاضافة رخصة جديدة',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white))
                            ],
                          )),
                    ),
                  if (obj.license.isEmpty) SizedBox(height: 10),
                ],
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LicensesPage()),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFF00BFA6),
                  Color(0xFF00BFA6),
                  Color(0xFF00BFA6),
                  Color(0xFF00BFA6),
                ],
              ),
            ),
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.white,
            )),
          ),
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}
