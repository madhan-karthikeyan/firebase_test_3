import 'package:firebase_test_3/widgets/text_field_name.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController_ = TextEditingController();

  final TextEditingController passwordController_ = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E4AB),
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Center(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CAT Fix',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 83.02,
                      fontFamily: 'Khand',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/construction_login_image.jpeg",
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  // const Text(
                  //   "Let's get started",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 36,
                  //     fontFamily: 'Inter',
                  //     fontWeight: FontWeight.w500,
                  //     //height: 0,
                  //   ),
                  //),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                      controller: emailController_, icon: Icons.email),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                      controller: passwordController_, icon: Icons.lock),
                  const SizedBox(
                    height: 38,
                  ),
                  Container(
                    width: 308,
                    height: 50.24,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF2CB63),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        //height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 32,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Color(0xFF5E626B),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    
                      ),
                      Text(
            'Sign up',
            style: TextStyle(
              color: Color(0xFF0386D0),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),),
                  SizedBox(height: 68,),
                  
                    ],
                  ),
                  Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By logging in you are agreeing our ',
                  style: TextStyle(
                    color: Color(0xFF5E626B),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'Term and privacy polic',
                  style: TextStyle(
                    color: Color(0xFF0386D0),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'y',
                  style: TextStyle(
                    color: Color(0xFF036BB9),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
