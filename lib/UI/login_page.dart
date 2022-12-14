import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna/busniss.dart';
import 'package:rakna/ui/signup_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image(
                        image: AssetImage(
                          'images/logo.jpg',
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                      child: Text(
                        'هتوفر وقـتـك و أعصــابـك ',
                        style: TextStyle(
                          fontFamily: 'Mada',
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 20,
                              width: 18,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Container(
                              height: 20,
                              width: 18,
                              decoration: BoxDecoration(
                                color: Colors.orange[800],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Container(
                              height: 20,
                              width: 18,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.orange[800],
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF205375),
                          contentPadding: const EdgeInsets.all(15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'البريد الإلكتروني ',
                          labelStyle: const TextStyle(
                            fontFamily: 'Mada',
                            color: Colors.white,
                          ),
                          suffix: Icon(
                            Icons.email_sharp,
                            color: Colors.orange[800],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorRadius: const Radius.circular(25),
                        cursorColor: Colors.orange[800],
                        style: TextStyle(color: Colors.orange[800]),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF205375),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'كلمة الـسـر',
                          labelStyle: const TextStyle(
                            fontFamily: 'Mada',
                            color: Colors.white,
                          ),
                          // hintText: 'Enter Your Password',
                          // hintStyle: TextStyle(color: Colors.orange[600]),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.orange[800],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 130,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFF66B0E),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Do()),
                            );
                          },
                          child: const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontFamily: 'Mada',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Image(
                      image: AssetImage(
                        'images/line.jpg',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()),
                            );
                          },
                          child: const Text(
                            'سجل من هنا ',
                            style: TextStyle(
                              fontFamily: 'Mada',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 90.0),
                          child: Text(
                            '! معندكش حساب  ',
                            style: TextStyle(
                              fontFamily: 'Mada',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Consumer<Business>(
                  builder: (context, value, child) {
                    return Text(
                        value.license.isEmpty
                            ? 'no data'
                            : value.license[0].licenseNumber.toString(),
                        style: const TextStyle(color: Colors.white));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
