import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:ourproct_mytask/models/auth_model.dart';
import 'package:ourproct_mytask/services/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
 final TextEditingController Registerusername=TextEditingController();
  final TextEditingController Registeremail=TextEditingController();
 final  TextEditingController Registerpassword=TextEditingController();
  final TextEditingController Loginemail=TextEditingController();
  final TextEditingController Loginpassword=TextEditingController();

  RegisterNewUser()
  {
    emit(AuthRegisterLoading());
    DioHelper.post('users', {
      'name':Registerusername.text,
      'email':Registeremail.text,
      'password':Registerpassword.text,
      "avatar": "https://picsum.photos/800"


    }, '').then((value) {
      emit(AuthRegisterSuccess());
    }).catchError((error)
        {
          emit(AuthRegisterError());
        });

  }
  AuthModel ?model;
  LoginAUser()
  {

    emit(AuthLoginLoading());
    DioHelper.post('auth/login',
        {
          'email':Loginemail.text,
          'password':Loginpassword.text
        }

        , '').then((value) {
          model=AuthModel.fromJson(value.data);
          emit(AuthLoginSuccess());
    }).catchError((error){
      emit(AuthLoginError());

    });

  }
}
