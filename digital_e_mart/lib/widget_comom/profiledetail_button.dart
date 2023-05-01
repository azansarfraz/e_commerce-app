import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';

class ProfileDetailButon extends StatelessWidget {
  const ProfileDetailButon(
      {super.key, required this.cartnumber, required this.title});
  final String cartnumber;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cartnumber.text.fontFamily(bold).color(darkFontGrey).make(),
        5.heightBox,
        title.text.fontFamily(bold).color(darkFontGrey).make(),
      ],
    ).box.white.roundedSM.width(100).padding(EdgeInsets.all(12)).make();
  }
}
