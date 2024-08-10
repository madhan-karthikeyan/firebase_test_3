import 'package:firebase_test_3/widgets/text_field_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController userNameController_ = TextEditingController();
  final TextEditingController dobController_ = TextEditingController();
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
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/CAT_Icon.jpg",
                        cacheWidth: 224,
                        cacheHeight: 102,
                      ),
                    ],
                  ),

                  Container(
                    height: 272,
                    width: double.maxFinite,
                    child: Expanded(
                      child: Image.network(
                        "assets/construction_login_image.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  
                  TextFieldInput(
                      controller: userNameController_,
                      icon: Icons.supervised_user_circle),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                      controller: dobController_, icon: Icons.calendar_today),
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
                  Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.check_box),
                        Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I have read the ',
                                    style: TextStyle(
                                      color: Color(0xFF5E626B),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Terms and conditions ',
                                    style: TextStyle(
                                      color: Color(0xFF0386D0),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                text: 'and agree to adhere to them',
                                style: TextStyle(
                                  color: Color(0xFF525252),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              ])
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13,),
                  GestureDetector(
                    onTap: () {
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
                  SizedBox(height: 13,),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
