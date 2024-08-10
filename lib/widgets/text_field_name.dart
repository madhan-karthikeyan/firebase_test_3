import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller_;
  final IconData icon_;
  const TextFieldInput({super.key, required TextEditingController controller, required IconData icon}) : controller_ = controller, icon_ = icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
            width: double.maxFinite,
            height: 48,
            //padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFF6D6D6D),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Row(  
                children: [ 
                  SizedBox(width: 16,),
                  Icon(icon_, size: 24,),
                  SizedBox(width: 10,),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(315, 50)),
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                      controller: controller_, ) )
                ],
              ),
            ),
          ),
    );
      
  }
}
