import 'package:digital_e_mart/Screen_page/cart_screen.dart';
import 'package:digital_e_mart/Screen_page/categpey_screen.dart';

import 'package:digital_e_mart/Screen_page/home_screen.dart';
import 'package:digital_e_mart/Screen_page/profile_Screen.dart';
import 'package:digital_e_mart/controllar/home_controllar.dart';
import 'package:digital_e_mart/widget_comom/dialog.dart';
import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

///material app use within consts

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //call screen coltrollar
    // var controller = Get.put(HomeController);
    var currentNavindex = 0.obs;

    var navbarIteams = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: category),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];
    var navbody = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return WillPopScope(
      ////show dilod want exit etc
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,

          ///dialog no aytomatical off
          context: context,
          builder: (context) => Dialog_Exit(),
        );
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(() =>
                Expanded(child: navbody.elementAt(currentNavindex.value))),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: currentNavindex.value,
            selectedItemColor: redColor,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items: navbarIteams,
            onTap: (value) {
              currentNavindex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
