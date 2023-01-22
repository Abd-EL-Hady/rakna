import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rakna/UI/login_page.dart';
import 'package:rakna/ui/verify_phone_page.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import '../busniss.dart';

class LicencePage extends StatefulWidget {
  const LicencePage({Key? key}) : super(key: key);

  @override
  State<LicencePage> createState() => _LicencePageState();
}

enum License { face, back }

class _LicencePageState extends State<LicencePage> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _licenseface;
  File? _licenseback;
  String? _LicensefaceUrl;
  String? _LicensebackUrl;
  bool approved = false;

  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery(License ssn) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (ssn == License.face) {
          _licenseface = File(pickedFile.path);
        } else {
          _licenseback = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera(License license) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        if (license == License.face) {
          _licenseface = File(pickedFile.path);
        } else {
          _licenseback = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile(BuildContext context) async {
    try {
      if (_licenseface != null) {
        firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(
            'licenseface/${basename(_licenseface!.path) + "-" + DateTime.now().toString()}');
        firebase_storage.UploadTask uploadTask = ref.putFile(_licenseface!);
        await uploadTask.whenComplete(() async {
          _LicensefaceUrl = await ref.getDownloadURL();
        });
      }
      if (_licenseback != null) {
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('licenseback/${basename(_licenseback!.path)}');
        firebase_storage.UploadTask uploadTask = ref.putFile(_licenseback!);
        await uploadTask.whenComplete(() async {
          _LicensebackUrl = await ref.getDownloadURL();
        });
      }
    } catch (e) {
      print(e);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('خطأ'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
      rethrow;
    }
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController license_numberController = TextEditingController();
  TextEditingController license_typeController = TextEditingController();
  TextEditingController license_expiration_dateController = TextEditingController();
  TextEditingController license_id_reference_faceController = TextEditingController();
  TextEditingController license_id_reference_backController = TextEditingController();
  TextEditingController car_nameController = TextEditingController();
  TextEditingController car_modelController = TextEditingController();
  TextEditingController car_colorController = TextEditingController();
  TextEditingController car_plates_numberController = TextEditingController();
  TextEditingController car_typeController = TextEditingController();
  TextEditingController car_yearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                    'images/bg.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'من النهاردة ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'مش هتتأخر عشان',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 30,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' بتركن',
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 30,
                                fontFamily: 'cairo',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Image(
                        image: AssetImage(
                          'images/line.jpg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: license_numberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل رقم الرخصة';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'رقم الرخصة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            suffix: Icon(
                              Icons.email,
                              color: Colors.orange[600],
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: car_nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل اسم السيارة';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'اسم السيارة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            suffix: Icon(
                              Icons.person,
                              color: Colors.orange[600],
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: car_modelController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل موديل السيارة';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'موديل السيارة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            suffix: Icon(
                              Icons.person,
                              color: Colors.orange[600],
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: car_plates_numberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل رقم لوحة السيارة';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'رقم لوحة السيارة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            suffix: Icon(
                              Icons.credit_card,
                              color: Colors.orange[600],
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: car_colorController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل لون السيارة';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'لون السيارة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            suffix: Icon(
                              Icons.location_city,
                              color: Colors.orange[600],
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: license_typeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل نوع الرخصة';
                            }
                            return null;
                          },
                          cursorRadius: const Radius.circular(25),
                          cursorColor: Colors.orange[600],
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'نوع الرخصة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            // hintText: 'Enter Your Password',
                            // hintStyle: TextStyle(color: Colors.orange[600]),

                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: license_expiration_dateController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل تاريخ انتهاء الرخصة';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'تاريخ انتهاء الرخصة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),

                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: car_typeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل نوع السيارة';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          cursorRadius: const Radius.circular(25),
                          cursorColor: Colors.orange[600],
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'نوع السيارة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: car_yearController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل سنة السيارة';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          cursorRadius: const Radius.circular(25),
                          cursorColor: Colors.orange[600],
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'سنة السيارة',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("اختيار الصورة"),
                                  content: Text(
                                      "الرجاء ارفاق صورة الرخصة السياقية (وجه+ظهر)"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromGallery(License.face);
                                        },
                                        child: Text('الاستديو')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromCamera(License.face);
                                        },
                                        child: Text('الكاميرا')),
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
                              child: Text(
                                'الرجاء ارفاق صورة الرخصة السياقية (وجه+ظهر)', //الصورة الشخصية
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cairo',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          if (_licenseface != null)
                            Image.file(
                              _licenseface!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("اختيار الصورة"),
                                  content: Text(
                                      "الرجاء ارفاق صورة الرخصة السياقية (وجه+ظهر)"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromGallery(License.back);
                                        },
                                        child: Text('الاستديو')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromCamera(License.back);
                                        },
                                        child: Text('الكاميرا'))
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
                              child: Text(
                                'الرجاء ارفاق صورة الرخصة السياقية (وجه+ظهر)', //الصورة الشخصية
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cairo',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          if (_licenseface != null)
                            Image.file(
                              _licenseface!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'الشروط و الأحكام ',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                              fontSize: 16),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'الموافقة علي الشروط و الأحكام ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'cairo',
                                fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (approved == false) {
                                  approved = true;
                                } else {
                                  approved = false;
                                }
                              });
                            },
                            icon: Icon(
                              approved == false
                                  ? Icons.check_box_outline_blank
                                  : Icons.check_box,
                              color: Colors.orange[600],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.orange[600],
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                approved == true &&
                                _licenseface != null &&
                                _licenseface != null) {
                              try {
                                await uploadFile(context);

                                Provider.of<Business>(context, listen: false)
                                    .addLicense(
                                    license_numberController.value.text,
                                    license_typeController.value.text,
                                    license_expiration_dateController.value.text,
                                    car_nameController.value.text,
                                    car_modelController.value.text,
                                    car_colorController.value.text,
                                    car_plates_numberController.value.text,
                                    car_typeController.value.text,
                                    car_yearController.value.text,
                                    _LicensefaceUrl!, _LicensefaceUrl!, context);
                              } catch (e) {
                                print(e);

                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("تنبيه"),
                                      content: Text(" حدث خطأ ما" +
                                          "/n" +
                                          e.toString()),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("حسنا"))
                                      ],
                                    ));
                              }
                            } else {
                              print('error');
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("تنبيه"),
                                    content: Text(" يجب ملئ جميع الحقول"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("حسنا"))
                                    ],
                                  ));
                            }
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 60,
                            child: Center(
                              child: Text(
                                'ﺇضافة رخصة السيارة',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cairo',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
