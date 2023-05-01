import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileimgpath = ''.obs;
  var profileimagelink = '';

  changeimage() async {
    final img = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);
    try {
      if (img == null) return;
      profileimgpath.value = img.path;
    } catch (e) {
      print(e);
    }
  }

  uploadprofileimage() async {
    ///create path
    var filename = basename(profileimgpath.value);
    var destination = 'images/${currentUser!.uid}/filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileimgpath.value));
    profileimagelink = await ref.getDownloadURL();
  }

  updateprofile(name,password,imageUlr) async {
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
   await store.set({
      
        'name':name,
        'password':password,
        'imageUlr':imageUlr,


      },SetOptions(merge: true));
  }
}
