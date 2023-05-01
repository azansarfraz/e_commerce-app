import 'package:digital_e_mart/consts/consts.dart';
import 'package:flutter/material.dart';

class Text_field extends StatelessWidget {
  const Text_field(
      {super.key,
      required this.textname,
      required this.hitname,
      this.Controllar,
      this.preficicon,
      this.suffixicon,
      required this.Obcuretext,
      this.Validator});
  final String textname;
  final String hitname;
  final Validator;
  final Controllar;
  final bool Obcuretext;
  final preficicon;
  final suffixicon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textname.text.color(Colors.blue).fontFamily(bold).size(16).make(),
        5.heightBox,
        TextFormField(
          controller: Controllar,
          obscureText: Obcuretext,
          validator: Validator,
          decoration: InputDecoration(
            hintText: hitname,
            hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
            fillColor: lightGrey,
            isDense: true,
            filled: true,
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(),
            ),
            prefix: preficicon,
            suffix: suffixicon,
          ),
        ),
      ],
    );
  }
}

class TextFormFiels extends StatelessWidget {
  const TextFormFiels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "".text.color(redColor).fontFamily(bold).size(16).make(),
        5.heightBox,
        TextFormField()
      ],
    );
  }
}
