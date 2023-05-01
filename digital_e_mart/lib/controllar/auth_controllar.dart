import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:get/get.dart';

//authtical related all code backent or function
class AuthController extends GetxController {
  ///
  // SignupMethod({})async{

  // }
  //storedata method
  storeUserdata({name, password, email, phoneno, cart_count ,order_count ,wish_count}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'phoneno': phoneno,
      'uid': currentUser!.uid,
      'imageulr': '',
      'cart_count':cart_count,
      'order_count':order_count,
      'wishlist':wish_count,

    });

    ///image user profile
  }

  SignoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);

      VxToast.show(context, msg: e.toString());
    }
  }
}
