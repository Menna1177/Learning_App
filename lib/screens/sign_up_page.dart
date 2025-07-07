import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourproct_mytask/bloc/auth_cubit.dart';
import 'package:ourproct_mytask/comp/input_field.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>
{ final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffF4F6F8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AppBar(
          backgroundColor: Color(0xff046582),
          title: Padding(
            padding:  EdgeInsets.only(top:9.h),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context,state){
          return Padding(
            padding:  EdgeInsets.all(16.w),
            child: Form(
              key: _formkey,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputField(
                      controller:context.read<AuthCubit>().Registerusername ,
                      isemail: false,
                      ispassword: false,
                      isusername: true,
                      labelText: 'Name',
                      type: TextInputType.name,
                    ),
                    SizedBox(height: 12.h,),
                    InputField(labelText: 'E-Mail',
                        controller: context.read<AuthCubit>().Registeremail,
                        type: TextInputType.emailAddress
                        , isemail: true
                        , ispassword: false
                        , isusername: false),
                    SizedBox(height: 12.h,),
                    InputField(labelText: 'Password',
                        controller: context.read<AuthCubit>().Registerpassword,
                        type: TextInputType.visiblePassword,
                        isemail: false,
                        ispassword: true,
                        isusername: false
                    ),
                    SizedBox(height: 24.h,),
                    if(state is AuthRegisterLoading)
                     Center(
                       child: CircularProgressIndicator(
                         valueColor:AlwaysStoppedAnimation<Color>(Color(0xff90E0EF)),
                           backgroundColor: Color(0xffCAF0F8),
                       ),
                     )
                    else
                      SizedBox(
                        width: double.infinity.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFFBE0B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          child: Text("Sign Up",
                            style: TextStyle(
                              fontSize:25.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          onPressed: (){
                            if(_formkey.currentState!.validate()) {
                              context.read<AuthCubit>().RegisterNewUser();
                            }

                          },

                    ),
                      ),

                      if(state is AuthRegisterError)
                       Padding(
                         padding:  EdgeInsets.only(top:10.h),
                         child: Text(
                           "Registration Failed .Try again",
                           style: TextStyle(
                             color: Color(0xffff0000),
                             fontSize: 18.sp,
                             fontWeight: FontWeight.bold
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ),
                      if(state is AuthRegisterSuccess)
                        Padding(
                          //will change
                          padding: EdgeInsets.only(top:10.h ),
                         child: Text("success")
                        ),

                    TextButton(
                      child: Text("Already Have Account?",style:
                        TextStyle(
                         color: Color(0xff046582),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold
                        ),

                      ),
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                    )

                  ],


                )
            ),
          );
        },
      )



    );
  }

}