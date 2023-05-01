import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/Screen_page/category_iteam_detainls.dart';
import 'package:digital_e_mart/consts/list.dart';
import 'package:digital_e_mart/controllar/product_controller.dart';
import 'package:digital_e_mart/firestore_Services/services.dart';
import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:get/get.dart';

class CategoriesDetails extends StatelessWidget {
  const CategoriesDetails({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    // var controller = Get.find<ProductController>(); ////////
    var controller = Get.put(ProductController());
    return Scaffold(
        appBar: AppBar(
          title: (title!).text.white.make(),
        ),
        //subcategories create
        body: StreamBuilder(
            //stream builder use show real time change of application there are two part stream mean input or get data or builder show or put data
            stream: FirestoreServices.getproducts(title),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                //agr data na ae to ya show ho
                return Center(
                  child: "data not fetch".text.make(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: "no products found".text.make(),
                );
              } else {
                var data = snapshot.data!.docs;
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              controller.subcat.length,
                              (index) => '${controller.subcat[index]}'
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .size(15)
                                  .makeCentered()

                                  ///
                                  //container start
                                  .box
                                  .white
                                  .size(150, 60)
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .roundedSM
                                  .make()),
                        ),
                      ),
                    ),
                    //
                    //
                    20.heightBox,
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: lightGrey,
                      child: GridView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data[index]['p_image'][0],

                                ///0 index show first piture show in main product
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),

                              10.heightBox,
                              //title
                              "${data[index]['p_name']}"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              10.heightBox,
                              //price
                              // "${data[index]['p_price']}"
                              "Rs. ${data[index]['p_price']}"
                                  .numCurrency
                                  .text
                                  .fontFamily(semibold)
                                  .color(redColor)
                                  .size(16)
                                  .make(),
                            ],
                          )
                              .box
                              .white
                              .roundedSM
                              .shadowSm
                              .padding(EdgeInsets.all(12))
                              .make()
                              .onTap(() {
                            controller.Checkbox(
                                data[index]); /////checkdata fvirot or not
                            Get.to(() => IteamsDetails(
                                      title: "${data[index]['p_name']}",
                                      data: data[index],
                                    ) //pass data product to next item product details
                                );
                          });
                        },
                      ),
                    ))
                  ],
                );
              }
            }));
  }
}
