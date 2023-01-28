import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/busniss.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<Business>(context, listen: false).initProfile();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Image(
                image: AssetImage(
                  'images/bg.jpg',
                ),
              ),
              Consumer<Business>(builder: (context, obj, snapshot) {
                return Form(
                  child: Column(
                    key: formKey,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال البريد الالكتروني';
                            }
                            return null;
                          },
                          controller: obj.emailController,
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'البريد الإلكتروني ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            suffix: Icon(
                              Icons.email,
                              color: Colors.orange[600],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال كلمة المرور';
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: obj.passwordController,
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'كلمة السر ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال الاسم الاول';
                            }
                            return null;
                          },
                          controller: obj.first_nameController,
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'الاسم الأول ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال الاسم الاخير';
                            }
                            return null;
                          },
                          controller: obj.last_nameController,
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'الاسم الأخير ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال رقم الهاتف';
                            }
                            return null;
                          },
                          controller: obj.mobile_numberController,
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'رقم الهاتف ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال المدينة';
                            }
                            return null;
                          },
                          controller: obj.cityController,
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'المدينة ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال الرقم القومي';
                            }
                            return null;
                          },
                          controller: obj.SSNController,
                          style: TextStyle(
                            color: Colors.orange[600],
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'الرقم القومي ',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.orange[600],
                            ),
                          ),
                          onPressed: () {
                            print('pressed');
                            if (formKey.currentState?.validate() ?? true) {
                              print('valid');
                              print('valid');

                              try {
                                Provider.of<Business>(context, listen: false)
                                    .updateDetails(context);
                                print('done');
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: const Text(
                            'تغيير البيانات ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          const Image(
                            image: AssetImage(
                              'images/Home1.jpg',
                            ),
                          ),
                          const Positioned(
                            right: 110,
                            bottom: 60,
                            child: Text(
                              'الملف ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 135,
                            bottom: 10,
                            child: RichText(
                              text: const TextSpan(
                                text: 'الشخصي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
