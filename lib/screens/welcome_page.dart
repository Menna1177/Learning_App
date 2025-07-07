import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourproct_mytask/bloc/auth_cubit.dart';
import 'package:ourproct_mytask/screens/sign_up_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff046582),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 90.h,),
            Text(" Welcome to ",
              style: TextStyle(
                color: Color(0xffFFBE0B),
                fontSize: 40.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Learnzilla",
              style: TextStyle(
                color: Color(0xffFFBE0B),
                fontSize: 40.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.h,),
            Image.asset('assets/images/first_image.jpg',
              width: 380.w,
              height: 300.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 7.h,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFFBE0B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )

              ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                },
                child: Text("Start Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,

                  ),
                ))


          ],
        ),
      ),

    );
  }

}