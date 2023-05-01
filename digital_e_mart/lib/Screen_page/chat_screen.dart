import 'package:digital_e_mart/componetchat/sender_bibble.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/controllar/chat_controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: 'title'.text.fontFamily(bold).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                semderbubble(),
                semderbubble(),
              ],
            )),
            0.heightBox,
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.msgCotroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      hintText: 'types meesage..'),
                )),
                IconButton(
                    onPressed: () {
                      controller.sendmsg(controller.msgCotroller.text);
                      controller.msgCotroller.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: redColor,
                    ))
              ],
            ).box.height(80).padding(EdgeInsets.all(12)).make()
          ],
        ),
      ),
    );
  }
}
