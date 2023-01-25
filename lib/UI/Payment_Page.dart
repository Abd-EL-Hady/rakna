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

import '../Providers/busniss.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();
  TextEditingController cardExpireDateController = TextEditingController();

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
                          controller: cardNumberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل رقم البطاقة';
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
                            labelText: 'رقم البطاقة',
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
                          controller: cardTypeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل نوع البطاقة';
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
                            labelText: 'نوع البطاقة',
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
                          controller: cardExpireDateController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل تاريخ انتهاء البطاقة';
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
                            labelText: 'تاريخ انتهاء البطاقة',
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
                            if (_formKey.currentState!.validate()) {
                              try {

                                Provider.of<Business>(context, listen: false)
                                    .addPayment(cardNumberController.value.text,
                                        cardTypeController.value.text,
                                        cardExpireDateController.value.text,
                                    context);
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
                                'ﺇضافة البطاقة',
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
