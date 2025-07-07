import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourproct_mytask/bloc/auth_cubit.dart';

import '../screens/welcome_page.dart';

class AppRoot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      splitScreenMode: true,
      minTextAdapt: true,

      builder:(context,child){
        return MultiBlocProvider(providers: 
            [
              BlocProvider(create:
                  (context) => AuthCubit()
              ),
            ]
            , child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: WelcomePage(),

            ));
      } ,
    );
  }

}