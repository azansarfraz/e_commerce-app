import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/controllar/home_controllar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  var address = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var postalcode = TextEditingController();
  var phonenumber = TextEditingController();
  var totalproduct = 0.obs;
  calculate(data) {
    totalproduct.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalproduct.value =
          totalproduct.value + int.parse(data[i]['totalprice'].toString());
    }
  }

//payment method change
  var paymentindex = 0.obs;
  late dynamic productSnapshot;
  var products = [];
  //
  changepayment(index) {
    paymentindex.value == index;
  }

  //place order
  placemyorder( {required orderpaymentmethod, required totalAmont,} ) async {
    await getproductdetail();
    await firestore.collection(orderCollection).doc().set({
      "order_code": '7877645576',
      "order_by": FieldValue.serverTimestamp(),
      "order_by": currentUser!.uid,
      // 'order_by_name': Get.find<HomeController>(),
      'order_by_email': currentUser!.email,
      'order_by_address': address.text,
      'order_by_state': state.text,
      'order_by_city': city.text,
      'order_by_phone number': phonenumber.text,
      'shipping_method': 'Home delivery',
      'payment_method': orderpaymentmethod,
      'order_place': true,
      'totoal_Ammount': totalAmont,
      'orders': FieldValue.arrayUnion(products),
      'order_confirm':false,
      'oder_delivered':false,
       'oder_on_delivered':false,
      'order_on_delivery':'',
    });
  }

  getproductdetail() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'image': productSnapshot[i]['image'],
        'quantity': productSnapshot[i]['quantity'],
        'title': productSnapshot[i]['title'],
      });
    }
    print(products);
  }
}
