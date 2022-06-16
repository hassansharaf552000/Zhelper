import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/mangers/colors.dart';

class ThemeManger {
  static ThemeData setLightTheme() {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorsManger.darkPrimary,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ColorsManger.darkPrimary,
          primary: ColorsManger.darkPrimary),
      scaffoldBackgroundColor: Colors.white,
    );
  }
  static ThemeData setDarkTheme() {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorsManger.darkPrimary,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: ColorsManger.lightPrimary,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsManger.lightPrimary,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ColorsManger.darkPrimary,
          primary: ColorsManger.darkPrimary),
      scaffoldBackgroundColor: Colors.white,
    );
  }


}
