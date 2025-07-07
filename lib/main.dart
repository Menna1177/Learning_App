import 'package:flutter/material.dart';
import 'package:ourproct_mytask/services/dio_helper.dart';
import 'package:ourproct_mytask/src/app_root.dart';

void main() {
  DioHelper.init();
  runApp( AppRoot());
}

