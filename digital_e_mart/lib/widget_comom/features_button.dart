import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';

class FeatureButton extends StatelessWidget {
  FeatureButton({super.key, this.icon, required this.title});

  final String title;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 50,
            fit: BoxFit.fill,
          ),
          10.widthBox,
          Text(
            title,
            style: TextStyle(
                fontFamily: semibold, color: Colors.black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
