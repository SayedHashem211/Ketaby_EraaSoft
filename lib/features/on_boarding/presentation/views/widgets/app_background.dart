import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppBackground extends StatelessWidget {
  const AppBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.28,
      decoration:  BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(600.r),
          bottomRight: Radius.circular(600.r),
        ),
      ),
      child: Image.asset('assets/images/logo.png', fit: BoxFit.fill),
    );
  }
}
