import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/Screen_page/categories_details.dart';
import 'package:digital_e_mart/Screen_page/chat_screen.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/consts/list.dart';

import 'package:digital_e_mart/controllar/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:get/get.dart';

class IteamsDetails extends StatelessWidget {
  const IteamsDetails({super.key, required this.title, this.data});
  final String? title;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    ////quantity increase or descress show
    var controler = Get.find<ProductController>();
    // return WillPopScope(
    //   onWillPop: () async {
    //     controler.resetValue();
    //     return true;
    //   },
    //   child:
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controler.resetValue();
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(title!),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          Obx(
            () => IconButton(
                onPressed: () {
                  if (controler.isfavorot.value) {
                    controler.removefromwishlist(data.id);
                    controler.isfavorot(false);
                  } else {
                    controler.addwishlist(data.id);
                    controler.isfavorot(true);
                  }
                },
                icon: Icon(
                  Icons.favorite,
                  color: controler.isfavorot.value ? redColor : darkFontGrey,
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                    viewportFraction: 0.9,

                    ///image with show
                    // aspectRatio: 16 / 12,
                    height: 400,
                    itemCount: data['p_image'].length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        data['p_image'][index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  10.heightBox,

                  //title desply of product
                  title!.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  //rating
                  10.heightBox,
                  VxRating(
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    size: 25,
                    maxRating: 5,
                    isSelectable: false,
                    count: 5,
                    stepInt: false,
                  ),
                  //
                  10.heightBox,
                  Row(
                    children: [
                      'Rs. '
                          .text
                          .fontFamily(semibold)
                          .color(redColor)
                          .size(18)
                          .make(),
                      '${data['p_price']}'
                          .numCurrency
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(18)
                          .make(),
                    ],
                  ),
                  //
                  10.heightBox,
                  Container(
                    color: Color.fromARGB(255, 166, 164, 164),
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              '${data['p_seller']}'
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .color(darkFontGrey)
                                  .size(16)
                                  .fontFamily(semibold)
                                  .make(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(Icons.message_rounded),
                          ).onTap(() {
                            Get.to(() => const ChatScreen(), arguments: [
                              data['p_seller'],
                              data['vendor_id'],
                            ]);
                          }),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  //color selection
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Colors'.text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  data['p_color'].length,
                                  (index) => Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          VxBox()
                                              .size(40, 40)
                                              .color(Vx.randomPrimaryColor)
                                              .roundedFull
                                              .margin(EdgeInsets.symmetric(
                                                  horizontal: 6))
                                              .make()
                                              .onTap(() {
                                            controler.changecolorIndex(index);
                                          }),
                                          Visibility(
                                              visible: index ==
                                                  controler.colorIndex.value,
                                              child: Icon(
                                                Icons.done,
                                                color: Colors.white,
                                              ))
                                        ],
                                      )),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).white.make(),
                        //price increament or decremwnt

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Quantity'.text.color(darkFontGrey).make(),
                            ),
                            Obx(
                              () => //show current value in realtime
                                  Row(children: [
                                IconButton(
                                    onPressed: () {
                                      controler.decreamentvalue();
                                      controler.caculatetotslprice(
                                          int.parse((data['p_price'])));
                                    },
                                    icon: Icon(Icons.remove)),
                                controler.quantitycount.value.text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {
                                      controler.increamentvalue(
                                          int.parse(data['p_quantity']));
                                      controler.caculatetotslprice(
                                          int.parse((data['p_price'])));
                                    },
                                    icon: Icon(Icons.add)),
                                10.widthBox,
                                '${data['p_quantity']}'
                                    .text
                                    .color(textfieldGrey)
                                    .make()
                              ]),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).white.make(),

                        ///tatol price
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Total'.text.color(textfieldGrey).make(),
                            ),
                            '${controler.totalprice.value}'
                                .numCurrency
                                .text
                                .color(redColor)
                                .size(16)
                                .fontFamily(bold)
                                .make()
                          ],
                        ).box.padding(EdgeInsets.all(8)).white.make(),
                      ],
                    ).box.white.shadowSm.make(),
                  ),
                  //
                  //description
                  //
                  10.heightBox,
                  'description'
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .size(18)
                      .make(),
                  5.heightBox,

                  "${data['p_description']}"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),

                  //list
                  10.heightBox,
                  ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          iteamsbuttondetails.length,
                          (index) => ListTile(
                                title: '${iteamsbuttondetails[index]}'
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                                trailing: Icon(Icons.arrow_forward),
                              ))),
                  20.heightBox,
                  ////product my also like
                  productsynomylike.text
                      .fontFamily(bold)
                      .size(16)
                      .color(darkFontGrey)
                      .make(),
                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP1,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
                                    //title
                                    "laptop"
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    //price
                                    "\$900"
                                        .text
                                        .fontFamily(semibold)
                                        .color(redColor)
                                        .size(16)
                                        .make(),
                                  ],
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 4),
                              )),
                    ),
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  if (controler.quantitycount.value > 0) {
                    controler.addtocart(
                      color: data['p_color'],
                      // vendorId: data['vendor_id'],
                      image: data['p_image'][0],
                      title: data['p_name'],
                      quantity: data['p_quantity'],
                      sellername: data['p_seller'],
                      uid: currentUser?.uid,
                      totalprice: controler.totalprice.value,
                    );
                    VxToast.show(context, msg: 'Added to cart');
                  } else {
                    VxToast.show(context, msg: 'Quantity can not be assign');
                  }
                },
                child: "Add to cart".text.make()),
          )
        ],
      ),
      // ),
    );
  }
}
