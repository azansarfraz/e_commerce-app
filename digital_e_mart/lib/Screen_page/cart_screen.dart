import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/Screen_page/shipping.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/controllar/cart_controller.dart';
import 'package:digital_e_mart/firestore_Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: 'Shopping cart'.text.color(Colors.black).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getcart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: "not load data".text.make());
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(child: "cart is empty".text.make());
          } else {
            var data = snapshot.data!.docs;
            controller.calculate(data);
            controller.productSnapshot = data;

            ///
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Color.fromARGB(255, 227, 225, 225),
                          child: ListTile(
                            leading: Image(
                                image: NetworkImage("${data[index]['image']}")),
                            title:
                                "${data[index]['title']}(X${data[index]['quantity']})"
                                    .text
                                    .size(14)
                                    .fontFamily(bold)
                                    .make(),
                            subtitle: Row(
                              children: [
                                'Rs. '
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(14)
                                    .make(),
                                "${data[index]['totalprice']}"
                                    .text
                                    .size(14)
                                    .make(),
                              ],
                            ),
                            trailing: Icon(
                              Icons.delete,
                              color: redColor,
                            ).onTap(() {
                              FirestoreServices.deletdocument(data[index].id);
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Tatal Price"
                          .text
                          .size(16)
                          .fontFamily(bold)
                          .color(Colors.black)
                          .make(),
                      Obx(
                        () => "${controller.totalproduct.value}"
                            .numCurrency
                            .text
                            .size(16)
                            .fontFamily(bold)
                            .color(Colors.black)
                            .make(),
                      ),
                    ],
                  )
                      .box
                      .padding(EdgeInsets.all(12))
                      .color(Color.fromARGB(255, 245, 197, 155))
                      .roundedSM
                      .make(),
                  10.heightBox,
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Get.to(() => ShippingDetails());
            },
            child: 'Continue'.text.make()),
      ),
    );
  }
}
