import 'package:digital_e_mart/Screen_page/chat_screen.dart';
import 'package:digital_e_mart/Screen_page/home_screen.dart';
import 'package:digital_e_mart/Screen_page/login.dart';
import 'package:digital_e_mart/Screen_page/payment_method.dart';
import 'package:digital_e_mart/Screen_page/sign_up.dart';
import 'package:digital_e_mart/Screen_page/splash_screen.dart';
import 'package:digital_e_mart/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
