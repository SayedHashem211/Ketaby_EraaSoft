import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme {

  static Color primaryColor = const Color(0xFF001B48);
  static Color lightBlue = const Color(0xFFD6E8EE);
  static Color mediumLightBlue = const Color(0xFF97CADB);
  static final ThemeData lightTheme = ThemeData(
      //scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18)
              )
          )
      ),


      cardColor: Colors.white,
     // accentColor: lightPrimary,
      textTheme:  TextTheme(
          headline6: TextStyle(
            fontSize: 23.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,

          ),
          headline4: TextStyle(
            fontSize: 28.sp,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
              fontSize: 14.sp,
              color: Colors.black
          )
      ),
   //   primaryColor: lightPrimary,
      appBarTheme:  AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500
          ),
          iconTheme: const IconThemeData(
              color: Colors.black
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
              size: 36.sp,
              color: Colors.black
          ),
          unselectedIconTheme: IconThemeData(
              size: 24.sp,
              color: Colors.white
          ),
          selectedLabelStyle: const TextStyle(
              color: Colors.black
          ),
          selectedItemColor: Colors.black
      )
  );
}
