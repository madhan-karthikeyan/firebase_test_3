import 'package:firebase_test_3/widgets/text_field_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 15,),
                      Image.asset(
                        "assets/CAT_Icon.jpg",
                        cacheWidth: 224,
                        cacheHeight: 102,
                      ),
                    ],
                  ),
                  
                  Container(
                    height: 272,
                    child: Expanded(
                      child: Image.asset(
                        "assets/construction_login_image.jpeg",
                        //fit: BoxFit.contain,
                      ),
                    ),
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
                    height: 14,
                  ),
                  GestureDetector(
                    onTap: (){ 
                      context.go("/homepage");
                    },
                    child: Padding(
                      
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: double.maxFinite,
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
                    ),
                  ),
                  SizedBox(height: 32,),
                  GestureDetector(
                    onTap: () {
                      context.go('/signuppage');
                    },
                    child: Row(
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
                    SizedBox(height: 34,),
                    
                      ],
                    ),
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
                  text: 'Term and privacy policy',
                  style: TextStyle(
                    color: Color(0xFF0386D0),
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
