import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/model/category_model.dart';

class FirestoreServices {
  static getuser(uid) {
    //uid is refrence of user
    //////static method
    /////get user data
    return firestore
        .collection(userCollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }

  /// get according to category
  ///

  static getproducts(category) {
    //method create
    return firestore
        .collection("products")
        .where("p_category", isEqualTo: category)
        .snapshots();
  }

  static getcart(uid) {
    //method create
    return firestore
        .collection(cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  //cart delete acction
  static deletdocument(docid) {
    return firestore.collection(cartCollection).doc(docid).delete();
  }

  static getwishlist() {
    return firestore
        .collection(productsCollection)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  //all product
  static allproduct() {
    return firestore.collection("products").snapshots();
  }

  static getfeatureproduct() {
    return firestore
        .collection(productsCollection)
        .where('is_feature', isEqualTo: true)
        .snapshots();
  }
}
