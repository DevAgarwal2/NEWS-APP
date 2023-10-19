import "dart:async";

import "package:flutter/material.dart";
import "package:newsapp/introScreen/auth/auth_method.dart";
import "package:newsapp/introScreen/auth/auth_service.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logotype_8364613.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
