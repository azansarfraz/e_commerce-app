import 'package:digital_e_mart/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Dialog_Exit extends StatefulWidget {
  const Dialog_Exit({super.key});

  @override
  State<Dialog_Exit> createState() => _Dialog_ExitState();
}

class _Dialog_ExitState extends State<Dialog_Exit> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          20.heightBox,
          "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
          Divider(),
          10.heightBox,
          "Ae you sure you want to exit"
              .text
              .size(16)
              .color(darkFontGrey)
              .make(),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: "yes".text.make()),
              // 20.widthBox,
              ElevatedButton(
                  onPressed: () {
                    navigator!.pop(context);
                  },
                  child: "No".text.make())
            ],
          )
        ],
      ).box.white.height(180).roundedSM.shadowSm.make(),
    );
  }
}
