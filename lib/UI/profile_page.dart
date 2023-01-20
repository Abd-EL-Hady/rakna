import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna/busniss.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController first_nameController = TextEditingController();
  TextEditingController last_nameController = TextEditingController();
  TextEditingController mobile_numberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController SSNController = TextEditingController();

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
                Form(
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
                            if (value!.isEmpty){
                              return 'الرجاء ادخال البريد الالكتروني';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty){
                              return 'الرجاء ادخال كلمة المرور';
                            }
                            return null;
                          },
                          controller: passwordController,
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
                              fontFamily: 'Mada',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty){
                              return 'الرجاء ادخال الاسم الاول';
                            }
                            return null;
                          },
                          controller: first_nameController,
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
                              fontFamily: 'Mada',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty){
                              return 'الرجاء ادخال الاسم الاخير';
                            }
                            return null;
                          },
                          controller: last_nameController,
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
                              fontFamily: 'Mada',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty){
                              return 'الرجاء ادخال رقم الهاتف';
                            }
                            return null;
                          },
                          controller:  mobile_numberController,
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
                              fontFamily: 'Mada',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty){
                              return 'الرجاء ادخال المدينة';
                            }
                            return null;
                          },
                          controller: cityController,
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
                              fontFamily: 'Mada',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty){
                              return 'الرجاء ادخال الرقم القومي';
                            }
                            return null;
                          },
                          controller: SSNController,
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
                              fontFamily: 'Mada',
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
                            if (formKey.currentState!.validate()) try {
                              Provider.of<Business>(context, listen: false)
                                  .updateDetails(
                                  emailController.text,
                                  passwordController.text,
                                  first_nameController.text,
                                  last_nameController.text,
                                  mobile_numberController.text,
                                  cityController.text,
                                  SSNController.text,
                                  context);
                            }catch (e){
                              print('error');
                            }
                          },


                          child: const Text(
                            'تغيير البيانات ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mada',
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
                                fontFamily: 'Mada',
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
                                  fontFamily: 'Mada',
                                  fontSize: 45,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
