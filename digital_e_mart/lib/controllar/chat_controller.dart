import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/controllar/home_controllar.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    // getChatId();
    super.onInit();
  }

  var chats = firestore.collection(chatsCollection);

  var frindName = Get.arguments[0];
  var frindId = Get.arguments[1];

  // var sendername = Get.find<HomeController>().currentNavindex;
  var currentid = currentUser!.uid;
  var msgCotroller = TextEditingController();

  dynamic chatDocid;

  getChatId() async {
    await chats
        .where('users', isEqualTo: {
          frindId: null,
          currentid: null,
        })
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            chatDocid = snapshot.docs.single.id;
          } else {
            chats.add({
              'create_on': null,
              'last_msg': '',
              'users': {frindId: null, currentid: null},
              'toid': '',
              'fromid': '',
              'frind_name': frindName,
              // 'sender_name': sendername,
            }).then((value) {
              chatDocid = value.id;
            });
          }
        });
  }

  sendmsg(msg) {
    if (msg.trim().isNotEmpty) {
      chats.doc(chatDocid).update({
        'create_on': FieldValue.serverTimestamp(),
        'last_msg': msg,
        'toid': frindId,
        'fromid': currentid
      });
      chats.doc(chatDocid).collection(messagesCollection).doc().set({
        'create_on': FieldValue.serverTimestamp(),
        'msg': msg,
        'uid': currentid
      });
    }
  }
  //
}
