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

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

enum SSN { face, back }

class _SignupPageState extends State<SignupPage> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _ssnface;
  File? _ssnback;
  String? _ssnfaceUrl;
  String? _ssnbackUrl;
  bool approved = false;

  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery(SSN ssn) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (ssn == SSN.face) {
          _ssnface = File(pickedFile.path);
        } else {
          _ssnback = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera(SSN ssn) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        if (ssn == SSN.face) {
          _ssnface = File(pickedFile.path);
        } else {
          _ssnback = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile(BuildContext context) async {
    try {
      if (_ssnface != null) {
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref().child(
                'ssnface/${basename(_ssnface!.path) + "-" + DateTime.now().toString()}');
        firebase_storage.UploadTask uploadTask = ref.putFile(_ssnface!);
        await uploadTask.whenComplete(() async {
          _ssnfaceUrl = await ref.getDownloadURL();
        });
      }
      if (_ssnback != null) {
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('ssnback/${basename(_ssnback!.path)}');
        firebase_storage.UploadTask uploadTask = ref.putFile(_ssnback!);
        await uploadTask.whenComplete(() async {
          _ssnbackUrl = await ref.getDownloadURL();
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController first_nameController = TextEditingController();
  TextEditingController last_nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController SSNController = TextEditingController();
  TextEditingController SSNbackController = TextEditingController();
  TextEditingController SSNfaceController = TextEditingController();
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
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال البريد الإلكتروني';
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
                            labelText: 'البريد الإلكتروني ',
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
                          controller: first_nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال الاسم الاول';
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
                            labelText: 'الاسم الاول ',
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
                          controller: last_nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال الاسم الاخير';
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
                            labelText: 'الاسم الاخير ',
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
                          controller: SSNController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 14) {
                              return 'الرجاء إدخال رقم بطاقة الرقم القومي';
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
                            labelText: 'رقم بطاقة الرقم القومي ',
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
                          controller: cityController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال المدينة';
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
                            labelText: 'المدينة ',
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
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال كلمة السر';
                            } else if (value.length < 6) {
                              return 'كلمة السر يجب ان تكون اكثر من 6 احرف';
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
                            labelText: 'كلمة السر',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            // hintText: 'Enter Your Password',
                            // hintStyle: TextStyle(color: Colors.orange[600]),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility_off,
                                color: Colors.orange[600],
                              ),
                              onPressed: () {},
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: repasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء اعادة إدخال كلمة السر';
                            } else if (value != passwordController.text) {
                              return 'كلمة السر غير متطابقة';
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
                            labelText: 'كلمة السر تاني ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility_off,
                                color: Colors.orange[600],
                              ),
                              onPressed: () {},
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال رقم الموبايل';
                            } else if (value.length < 11) {
                              return 'رقم الموبايل غير صحيح';
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
                            labelText: 'رقم موبايلك',
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
                                      "الرجاء ارفاق صورة بطاقة الرقم القومي (وجه)"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromGallery(SSN.face);
                                        },
                                        child: Text('الاستديو')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromCamera(SSN.face);
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
                                'صورة بطاقة الرقم القومي (وجه)', //الصورة الشخصية
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cairo',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          if (_ssnface != null)
                            Image.file(
                              _ssnface!,
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
                                      "الرجاء ارفاق صورة بطاقة الرقم القومي (ظهر)"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromGallery(SSN.back);
                                        },
                                        child: Text('الاستديو')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          imgFromCamera(SSN.back);
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
                                'صورة بطاقة الرقم القومي (ظهر)', //الصورة الشخصية
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cairo',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          if (_ssnback != null)
                            Image.file(
                              _ssnback!,
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
                                _ssnface != null &&
                                _ssnback != null) {
                              try {
                                await uploadFile(context);

                                Provider.of<Business>(context, listen: false)
                                    .signup(
                                        emailController.value.text,
                                        passwordController.value.text,
                                        first_nameController.value.text,
                                        last_nameController.value.text,
                                        phoneController.value.text,
                                        cityController.value.text,
                                        SSNController.value.text,
                                        _ssnbackUrl!,
                                        _ssnfaceUrl!,
                                        context);
                                print("email " + emailController.value.text);
                                print("password " +
                                    passwordController.value.text);
                                print("first_name " +
                                    first_nameController.value.text);
                                print("last_name " +
                                    last_nameController.value.text);
                                print("phone " + phoneController.value.text);
                                print("city " + cityController.value.text);
                                print("SSN " + SSNController.value.text);
                                print(
                                    "SSNBACK " + SSNbackController.value.text);
                                print(
                                    "SSNFACE " + SSNfaceController.value.text);
                                print("Label " + labelController.value.text);
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
                                'تسجيـــل',
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
