import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.text,
    required this.icon,
    this.width,
    this.height,
  });
  final String icon;
  final String text;
  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 26,
          ),
          Text(text)
        ],
      ),
    );
  }
}
  //input to annthing according to es
  
