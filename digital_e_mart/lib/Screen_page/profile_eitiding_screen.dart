import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/list.dart';
import 'package:digital_e_mart/controllar/profile_controller.dart';
import 'package:digital_e_mart/widget_comom/home_button.dart';
import 'package:digital_e_mart/widget_comom/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:digital_e_mart/globalmodel/usersigup_globalmodel.dart';

import '../model copy/usersignup_model.dart';

class ProfileEditingScreen extends StatefulWidget {
  // final dynamic data;
  const ProfileEditingScreen({
    super.key,
  });

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  File? file;
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No file Selected";
    // var controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            20.heightBox,
            GestureDetector(
              onTap: () {
                selectFile();
              },
              child: CircleAvatar(
                backgroundImage: file == null
                    ? AssetImage("assets/images/profile.jpg")
                    : Image.file(file!).image,
                radius: 30,
              ),
            ),
            // controller.profileimgpath.isEmpty
            // ? Image.asset(
            //     imgProfile2,
            //     width: 100,
            //     fit: BoxFit.cover,
            //   ).box.roundedFull.clip(Clip.antiAlias).make()
            // : Image.file(
            //     // File(controller.profileimgpath.value),
            //     width: 100,
            //     fit: BoxFit.cover,
            //   ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
                onPressed: () async {
                  if (file == null) {
                    VxToast.show(context, msg: "Please Select an Image");

                    return;
                  }

                  final FirebaseAuth _auth = FirebaseAuth.instance;

                  User? user = _auth.currentUser;
                  FirebaseFirestore firebaseFirestore =
                      FirebaseFirestore.instance;
                  UserSignupModel _usersignup = UserSignupModel();

                  final ref = FirebaseStorage.instance
                      .ref()
                      .child("userImage")
                      .child(DateTime.now().toString());
                  await ref.putFile(file!);
                  imageUrl = await ref.getDownloadURL();
                  print(imageUrl);
                  _usersignup.uid = user!.uid;
                  _usersignup.fullname = g_fullname;
                  _usersignup.email = g_email;
                  _usersignup.phoneno = g_phoneno;
                  _usersignup.password = g_password;
                  _usersignup.imageulr = imageUrl.toString();

                  await firebaseFirestore
                      .collection("No of buyer signup")
                      .doc(user.uid)
                      .set(_usersignup.toMap());

                  // controller.changeimage();
                },
                child: 'Change'.text.make()),
            10.heightBox,
            Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: "Name"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(16)
                        .make()),
                5.heightBox,
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'enter name',
                    hintStyle:
                        TextStyle(fontFamily: semibold, color: textfieldGrey),
                    fillColor: lightGrey,
                    isDense: true,
                    filled: true,
                  ),
                ),
                10.heightBox,
                Align(
                    alignment: Alignment.topLeft,
                    child: "Email"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(16)
                        .make()),
                5.heightBox,
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'email',
                    hintStyle:
                        TextStyle(fontFamily: semibold, color: textfieldGrey),
                    fillColor: lightGrey,
                    isDense: true,
                    filled: true,
                  ),
                )
              ],
            )
                .box
                .padding(EdgeInsets.all(12))
                .color(Color.fromARGB(255, 215, 220, 215))
                .make(),
            ElevatedButton(
              onPressed: () async {
                // await controller.uploadprofileimage();
                // await controller.updateprofile();
                VxToast.show(context, msg: 'opdate');
              },
              child: "save".text.make(),
            )
          ],
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }
}
