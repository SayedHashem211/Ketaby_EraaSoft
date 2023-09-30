import 'dart:async';

import 'package:flutter/material.dart';

import '../../../on_boarding/presentation/views/welcome_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const WelcomeScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF05A4A6),
        // image: DecorationImage(
        //     image: AssetImage('assets/images/logo2.png'),
        //     fit: BoxFit.contain
        // ),
      ),
      child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,),
    );
  }
}