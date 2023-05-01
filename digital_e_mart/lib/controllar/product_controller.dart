import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/model/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var colorIndex = 0.obs; //use select color
  var quantitycount = 0.obs;
  var totalprice = 0.obs;
  var isfavorot = false.obs;
  //create function
  var subcat = []; //line 13 to 25 json fetch categories
  getSubcategory(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("assets/service/category_json.json");
    var decode = categoryModelFromJson(data);
    var s =
        decode.categories.where((element) => element.name == title).toList();

    ///titile filter and than convert in to to string
    //now category save in s so i fetch subcategory in s so use for in
    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  changecolorIndex(index) {
    ///selectcolor function
    colorIndex = index;
  }

  increamentvalue(totalquantity) {
    if (quantitycount.value < totalquantity) {
      quantitycount.value++;
    }
  }

  decreamentvalue() {
    if (quantitycount.value > 0) {
      quantitycount.value--;
    }
  }

  caculatetotslprice(price) {
    totalprice.value = price * quantitycount.value;
  }

  addtocart({
    title,
    image,
    sellername,
    color,
    quantity,
    totalprice,
    uid,
    vendorId,
  }) async {
    await firestore.collection(cartCollection).doc().set({
      "title": title,
      "image": image,
      "sellername": sellername,
      "color": color,
      "quantity": quantity,
      // "vendor_id": vendorId,
      "totalprice": totalprice,
      "added_by": currentUser?.uid,
    });
  }

  resetValue() {
    ///ya os time use hota h jb hum product detail sy back jae to ya data ko reset kr dy ta ky other product py ya same data na ho
    totalprice.value = 0;
    quantitycount.value = 0;
    colorIndex.value = 0;
  }

  ///wishlistadd
  addwishlist(docid) async {
    await firestore.collection(productsCollection).doc(docid).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isfavorot(true);
  }

  removefromwishlist(docid) async {
    await firestore.collection(productsCollection).doc(docid).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));

    isfavorot(false);
  }

  Checkbox(data) async {
    if (data['p_wishlist'].contains(currentUser!.uid)) {
      isfavorot(true);
    } else {
      isfavorot(false);
    }
  }
}
