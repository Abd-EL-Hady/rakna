import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna/UI/login_page.dart';
import 'package:rakna/ui/verify_phone_page.dart';

import '../busniss.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController countController = TextEditingController()..text = '0';
  TextEditingController priceController = TextEditingController()..text = '0';
  TextEditingController totalController = TextEditingController()..text = '0';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const Image(
                  image: AssetImage(
                    'images/bg.jpg',
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: countController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          try {
                            totalController.text =
                                (int.parse(countController.text) *
                                        int.parse(priceController.text))
                                    .toString();
                          } catch (e) {
                            print(e);
                          }
                        });
                      },
                    ),
                    TextFormField(
                      controller: priceController,
                      onChanged: (value) {
                        setState(() {
                          totalController.text =
                              (int.parse(countController.text) *
                                      int.parse(priceController.text))
                                  .toString();
                        });
                      },
                    ),
                    TextFormField(
                      controller: totalController,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'من النهاردة ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontFamily: 'Mada',
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'مش هتتأخر عشان',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Mada',
                          fontSize: 30,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' بتركن',
                            style: TextStyle(
                              color: Colors.orange[600],
                              fontSize: 30,
                              fontFamily: 'Mada',
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
                            fontFamily: 'Mada',
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
                        controller: passwordController,
                        cursorRadius: const Radius.circular(25),
                        cursorColor: Colors.orange[600],
                        style: TextStyle(color: Colors.orange[600]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'كلمة السر',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mada',
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        style: TextStyle(
                          color: Colors.orange[600],
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'كلمة السر تاني ',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mada',
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.orange[600],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: labelController,
                        style: TextStyle(
                          color: Colors.orange[600],
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'رقم لوحة السيارة ',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mada',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneController,
                        cursorRadius: const Radius.circular(25),
                        cursorColor: Colors.orange[600],
                        style: TextStyle(color: Colors.orange[600]),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'رقم موبايلك',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mada',
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'الشروط و الأحكام ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Mada',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'الموافقة علي الشروط و الأحكام ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mada',
                          ),
                        ),
                        IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                          if (_formKey.currentState!.validate()) {
                            Provider.of<Business>(context, listen: false)
                                .signup(emailController.value.text,
                                passwordController.value.text,first_nameController.value.text ,last_nameController.value.text,
                                phoneController.value.text,cityController.value.text,SSNController.value.text,SSNbackController.value.text,SSNfaceController.value.text, context);
                          }

                          else {
                            print('error');
                          }
                        },
                        child: const Text(
                          '! سجل',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mada',
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
      ),
    );
  }
}
