import 'package:digital_e_mart/Screen_page/categories_details.dart';
import 'package:digital_e_mart/consts/list.dart';
import 'package:digital_e_mart/controllar/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Categories"),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.red,
              height: 200,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 200),
                      itemBuilder: (context, index) {
                        return 
                        InkWell(
                          onTap: () {
                            controller.getSubcategory(categoriestitleList[
                                index]); //category model fetch data
                            Get.to(() => CategoriesDetails(
                                  title: categoriestitleList[index],
                                ));
                          },
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 0.5,
                                    spreadRadius: 0.4,
                                  )
                                ]),
                            child:
                             Column(
                              children: [
                                Image.asset(
                                  categoriesPicList[index],
                                  height: 140,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      categoriestitleList[index],
                                      style: TextStyle(color: darkFontGrey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        //     .box
                        //     .white
                        //     .rounded
                        //     .clip(Clip.antiAlias)
                        //     .height(45)
                        //     .outerShadowSm //ontap function use in velocirty x
                        //     .make()
                        //     .onTap(() {
                        // controller.getSubcategory(categoriestitleList[
                        //     index]); //category model fetch data
                        // Get.to(() => CategoriesDetails(
                        //       title: categoriestitleList[index],
                        //     ));
                        // });

                        //  Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             color: Colors.blue,
                        //             image: DecorationImage(
                        //                 image: AssetImage(categoriesPicList[index]),
                        //                 fit: BoxFit.cover),
                        //             borderRadius: BorderRadius.only(
                        //                 topLeft: Radius.circular(10),
                        //                 topRight: Radius.circular(10))),
                        //         height: 130,
                        //         width: 200,
                        //       ),
                        //       Text("data")
                        //     ],
                        //   ),
                        // );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        )
        );
  }
}
