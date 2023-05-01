import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;
////
const userCollection = 'userss';
const productsCollection = "products";

///id of collection
const cartCollection = 'cart';
const orderCollection = 'orders';
const chatsCollection = 'chats';
const messagesCollection = 'messages';

///
///
