import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget{
   final  String ?labelText;
    final bool ?ispassword;
   final  bool  ?isusername;
  final   bool ?isemail;
  final   TextEditingController ?controller;
   final  TextInputType ?type;
    InputField({
      required this.labelText,
      required this.controller,
      required this.type,
      required this.isemail,
      required this.ispassword,
      required this.isusername
});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassword??false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffE0F7FA),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff00B4D8),
            width:2.w
          )
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: Color(0xff023047)
          ,

        )
      ),
      validator: (value){
        if(isusername==true && (value ==null || value.isEmpty) )
          {
            return "Please Enter your UserName";
          }
        else if (ispassword==true && (value==null || value.length<6))
          {
            return "Please Enter a Valid Password (cannot be less than 6). ";
          }
        else if (isemail==true && (value==null || !value.contains('@')))
          {
            return "Please Enter A Valid E-Mail ";
          }
        return null;
      },


    );
  }

}