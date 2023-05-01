import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/Screen_page/categories_details.dart';
import 'package:digital_e_mart/Screen_page/category_iteam_detainls.dart';
import 'package:digital_e_mart/consts/list.dart';
import 'package:digital_e_mart/controllar/product_controller.dart';
import 'package:digital_e_mart/firestore_Services/services.dart';
import 'package:digital_e_mart/widget_comom/home_advtise.dart';
import 'package:digital_e_mart/widget_comom/home_button.dart';
import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../widget_comom/features_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    final String? title;
    return Material(
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color.fromARGB(255, 226, 221, 221),
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                color: Color.fromARGB(255, 226, 221, 221),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: whiteColor,
                      hintText: searchingthing,
                      hintStyle: TextStyle(color: textfieldGrey),
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //brand slider

                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: sliderList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              sliderList[index],
                              fit: BoxFit.fill,
                            ),
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        },
                      ),
                      20.heightBox,

                      ///boxsize mean
                      //deals button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => HomeButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                  text: index == 0 ? todayDeal : flashsale,
                                )),
                      ),
                      //2nd slider
                      10.heightBox,

                      ///start advertisement product

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 3,
                                        spreadRadius: 1)
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://img.freepik.com/free-photo/studio-shot-pretty-black-woman-with-white-shopping-bag-standing-yellow-background-trendy-spring-fashionable-look_273443-10.jpg?w=360"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.23,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 3,
                                        spreadRadius: 1)
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1617922001439-4a2e6562f328?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d29tZW4lMjBmYXNoaW9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.23,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 3,
                                      spreadRadius: 1)
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://media.voguebusiness.com/photos/5ce3d84932029c6ded13e829/2:3/w_2560%2Cc_limit/online-product-may-19-article.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*********trending product  */
                      /////
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      //   child: Row(
                      //     children: [
                      //       Text("Tredning Products"),
                      //       Spacer(),
                      //       Text(
                      //         "SHOP MORE >",
                      //         style: TextStyle(
                      //             color: Color.fromARGB(255, 255, 154, 3)),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //     width: MediaQuery.of(context).size.width * 1,
                      //     height: MediaQuery.of(context).size.height * 0.2,
                      //     child: ListView.builder(
                      //       itemCount: 3,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         return Padding(
                      //           padding: const EdgeInsets.only(left: 8),
                      //           child: Container(
                      //               width: MediaQuery.of(context).size.width *
                      //                   0.34,
                      //               decoration: BoxDecoration(
                      //                   color: Colors.white,
                      //                   border: Border.all(
                      //                       color:
                      //                           Colors.black.withOpacity(0.5)),
                      //                   borderRadius:
                      //                       BorderRadius.circular(10)),
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.start,
                      //                 children: [
                      //                   Container(
                      //                     width: MediaQuery.of(context)
                      //                             .size
                      //                             .width *
                      //                         0.34,
                      //                     height: MediaQuery.of(context)
                      //                             .size
                      //                             .height *
                      //                         0.12,
                      //                     decoration: BoxDecoration(
                      //                         borderRadius: BorderRadius.only(
                      //                             topLeft: Radius.circular(10),
                      //                             topRight:
                      //                                 Radius.circular(10)),
                      //                         color: Colors.green,
                      //                         image: DecorationImage(
                      //                             image: NetworkImage(
                      //                                 "https://img.freepik.com/free-vector/white-product-podium-with-green-tropical-palm-leaves-golden-round-arch-green-wall_87521-3023.jpg"),
                      //                             fit: BoxFit.cover)),
                      //                     //   child:
                      //                     //    Image(
                      //                     //       height: 92,
                      //                     //       image: NetworkImage(
                      //                     //           "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80")),
                      //                   ),
                      //                   Text("data"),
                      //                   Text("data")
                      //                 ],
                      //               )),
                      //         );
                      //       },
                      //     )),
                      // VxSwiper.builder(
                      //   aspectRatio: 16 / 9,
                      //   autoPlay: true,
                      //   height: 150,
                      //   enlargeCenterPage: true,
                      //   itemCount: sliderList2.length,
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       child: Image.asset(
                      //         sliderList2[index],
                      //         fit: BoxFit.fill,
                      //       ),
                      //     )
                      //         .box
                      //         .rounded
                      //         .clip(Clip.antiAlias)
                      //         .margin(EdgeInsets.symmetric(horizontal: 8))
                      //         .make();
                      //   },
                      // ),
                      //button
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => HomeButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.29,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  icon: index == 0
                                      ? icTopCategories
                                      : index == 1
                                          ? icBrands
                                          : icTopSeller,
                                  text: index == 0
                                      ? topcategories
                                      : index == 1
                                          ? brand
                                          : topseller,
                                )),
                      ),
                      //features categories
                      20.heightBox,
                      Align(
                          alignment: Alignment.topLeft,
                          child: featurecategories.text
                              .color(darkFontGrey)
                              .size(18)
                              .fontFamily(semibold)
                              .make()),

                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(featureList1.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                if (index == 1) {
                                  'hjsdhjsd'.text.make();
                                }
                              },
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        controller.getSubcategory(
                                            categoriestitleList[
                                                index]); //category model fetch data
                                        Get.to(() => CategoriesDetails(
                                              title: categoriestitleList[index],
                                            ));
                                        print("link woman addres");
                                      }
                                    },
                                    child: FeatureButton(
                                      icon: featureList1[index],
                                      title: featuretitleList1[index],
                                    ),
                                  ),
                                  5.heightBox,
                                  FeatureButton(
                                    icon: featureList2[index],
                                    title: featuretitleList2[index],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      //featureproducts

                      20.heightBox,
                      Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 232, 94, 239)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featureproduct.text.white
                                .fontFamily(bold)
                                .size(18)
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: StreamBuilder(
                                  stream: FirestoreServices.getfeatureproduct(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: "not load data".text.make());
                                    } else if (snapshot.data!.docs.isEmpty) {
                                      return Center(
                                          child:
                                              "feature is empty".text.make());
                                    } else {
                                      var data = snapshot.data!.docs;

                                      return Row(
                                        children: List.generate(
                                            data.length,
                                            (index) => InkWell(
                                                  onTap: () {
                                                    Get.to(() => IteamsDetails(
                                                          title:
                                                              "${data[index]['p_name']}",
                                                          data: data[index],
                                                        ));
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.network(
                                                          data[index]['p_image']
                                                              [0],
                                                          width: 150,
                                                          height: 160,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        10.heightBox,
                                                        //title
                                                        "${data[index]['p_name']}"
                                                            .text
                                                            .fontFamily(
                                                                semibold)
                                                            .color(darkFontGrey)
                                                            .make(),
                                                        10.heightBox,
                                                        //price
                                                        Row(
                                                          children: [
                                                            'Rs. '
                                                                .text
                                                                .fontFamily(
                                                                    semibold)
                                                                .color(redColor)
                                                                .size(18)
                                                                .make(),
                                                            "${data[index]['p_price']}"
                                                                .text
                                                                .fontFamily(
                                                                    semibold)
                                                                .color(redColor)
                                                                .size(16)
                                                                .make(),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4),
                                                  ),
                                                )),
                                      );
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),

                      ///advertising product piture
                      //
                      10.heightBox,
                      PictureAdvitise(
                        imglink:
                            "https://media.allure.com/photos/5e34591a4b7d1e0008483b50/16:9/w_3200,h_1800,c_limit/LEDE_SOCIAL.jpg",
                        imglink1:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR_fbT0tTlOBZA0p0Q1NZUHMq1eXs8Lqz_ng&usqp=CAU",
                      ),
                      10.heightBox,
                      PictureAdvitise(
                        imglink:
                            "https://zeverat.pk/tpl_assets/2023/01/banner-1.jpg",
                        imglink1:
                            "https://fazaljeweller.com/wp-content/uploads/2021/12/Bridal.jpg",
                      ),
                      10.heightBox,
                      PictureAdvitise(
                        imglink:
                            "https://ichef.bbci.co.uk/news/976/cpsprodpb/B9FF/production/_117751674_satan-shoes1.jpg",
                        imglink1:
                            "https://static.dezeen.com/uploads/2021/04/lil-nas-x-mschf-nike-satan-shoes-blood-pentagram-bible-verse-design-fashion-footwear_dezeen_2364_sq4-scaled-1.jpg",
                      ),
                      10.heightBox,
                      PictureAdvitise(
                        imglink:
                            "https://media.glamour.com/photos/63cb17760c94f6a86c1097d7/16:9/w_3487,h_1961,c_limit/baby%20clothes.png",
                        imglink1:
                            "https://cdn.webshopapp.com/shops/51009/files/361880665/580x608x1/grown-knitted-playsuit-olive.jpg",
                      ),

                      10.heightBox,
                      //third slider
                      10.heightBox,
                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: sliderList2.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(sliderList2[index]),
                                    fit: BoxFit.fill)),
                          );
                        },
                      ),

                      //
                      //
                      20.heightBox,
                      //all product section show poducts
                      'All Products'
                          .text
                          .size(20)
                          .fontFamily(bold)
                          .makeCentered(),
                      20.heightBox,
                      StreamBuilder(
                        stream: FirestoreServices.allproduct(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: "not load data".text.make());
                          } else if (snapshot.data!.docs.isEmpty) {
                            return Center(child: " empty".text.make());
                          } else {
                            var allprodcutdata = snapshot.data!.docs;

                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: allprodcutdata.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      mainAxisExtent: 250),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      allprodcutdata[index]['p_image'][0],
                                      width: 180,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
                                    //title
                                    "${allprodcutdata[index]['p_name']}"
                                        .text
                                        .size(16)
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    //price
                                    "Rs. ${allprodcutdata[index]['p_price']}"
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
                                    .onInkTap(() {
                                  // controller.Checkbox(
                                  //     data[index]);
                                  ///////checkdata fvirot or not
                                  print("jhjkshfjkdf");
                                  Get.to(() => IteamsDetails(
                                            title:
                                                "${allprodcutdata[index]['p_name']}",
                                            data: allprodcutdata[index],
                                          )

                                      //pass data product to next item product details
                                      );
                                  print("jhjkshfjkdf");
                                });
                                //  Container(
                                //   padding: EdgeInsets.only(bottom: 8),
                                //   decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(10)),
                                //   child: Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     children: [
                                //       Image.network(
                                //         data[index]['p_image'][0],
                                //         width: 200,
                                //         height: 150,
                                //         fit: BoxFit.cover,
                                //       ),

                                //       10.heightBox,
                                //       //title
                                //       "${data[index]['p_name']}"
                                //           .text
                                //           .fontFamily(semibold)
                                //           .color(darkFontGrey)
                                //           .make(),
                                //       10.heightBox,
                                //       //price
                                //       "${data[index]['p_price']}"
                                //           .text
                                //           .fontFamily(semibold)
                                //           .color(redColor)
                                //           .size(16)
                                //           .make(),
                                //     ],
                                //   ),
                                // );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
