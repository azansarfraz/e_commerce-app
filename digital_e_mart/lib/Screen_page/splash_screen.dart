import 'package:digital_e_mart/Screen_page/login.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => login_page(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          20.heightBox,
          SpinKitSpinningLines(
            color: Colors.red,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
