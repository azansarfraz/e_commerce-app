import 'package:digital_e_mart/consts/consts.dart';
import 'package:flutter/material.dart';

class PictureAdvitise extends StatelessWidget {
  const PictureAdvitise({super.key, required this.imglink, required this.imglink1});
  final String imglink;
  final String imglink1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.617,
          height: MediaQuery.of(context).size.height * 0.17,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          child: Image(
            image: NetworkImage(imglink),
            fit: BoxFit.cover,
          ),
        ),
        //https://media.allure.com/photos/5e34591a4b7d1e0008483b50/16:9/w_3200,h_1800,c_limit/LEDE_SOCIAL.jpg
        //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR_fbT0tTlOBZA0p0Q1NZUHMq1eXs8Lqz_ng&usqp=CAU"
        10.widthBox,
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.17,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imglink1), fit: BoxFit.cover),
              color: Colors.green,
              borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }
}
