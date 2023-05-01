import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/Screen_page/login.dart';
import 'package:digital_e_mart/Screen_page/profile_eitiding_screen.dart';
import 'package:digital_e_mart/Screen_page/wishlist_screen.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/consts/list.dart';
import 'package:digital_e_mart/controllar/profile_controller.dart';
import 'package:digital_e_mart/firestore_Services/services.dart';
import 'package:digital_e_mart/globalmodel/usersigup_globalmodel.dart';
import 'package:digital_e_mart/main.dart';
import 'package:digital_e_mart/model%20copy/usersignup_model.dart';
import 'package:digital_e_mart/widget_comom/profiledetail_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? currentuser = FirebaseAuth.instance.currentUser;
  UserSignupModel _usersignup = UserSignupModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("No of buyer signup")
        .doc(currentUser!.uid)
        .get()
        .then((value) => _usersignup = UserSignupModel.fromMap(value.data()));
    print("added value in global");
    globalmodelsignup();
  }

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(ProfileController());

    ///intilize controller profile
    return Scaffold(
        body: StreamBuilder(
      stream: FirestoreServices.getuser(currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ),
          );
        else {
          // var data = snapshot.data!.docs[0]; ////////////////

          return Stack(
            children: [
              Container(
                color: Colors.red,
                height: 400,
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      //user profile edit
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ).onTap(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileEditingScreen(),
                                ));
                            // Get.to(() => ProfileEditingScreen(
                            //     // data: data,
                            //     ));
                          }),
                        ),
                      ),
                      //user details screen
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage("${_usersignup.imageulr}"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${_usersignup.fullname}"
                                  .text
                                  .fontFamily(bold)
                                  .size(16)
                                  .color(whiteColor)
                                  .make(),
                              5.heightBox,
                              "${_usersignup.email}"
                                  .text
                                  .white
                                  .fontFamily(bold)
                                  .color(whiteColor)
                                  .make(),
                            ],
                          ),
                          90.widthBox,
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.white)),
                              onPressed: () async {
                                await auth.signOut();
                                Get.offAll(() => login_page());
                              },
                              child: 'Logout'.text.white.make())
                        ],
                      ),
                      40.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileDetailButon(
                            cartnumber: "00",
                            title: 'You Cart',
                          ),
                          ProfileDetailButon(
                            cartnumber: '00',
                            title: 'wishList',
                          ),
                          ProfileDetailButon(
                            cartnumber: '00',
                            title: 'You order',
                          ),
                        ],
                      ),
                      //screenbuton
                      50.heightBox,
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                          );
                        },
                        itemCount: profilebuttonList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Get.to(() => WhishLIstScreen());
                                    break;
                                  case 1:
                                    Get.to(() => WhishLIstScreen());
                                    break;
                                  case 2:
                                    Get.to(() => WhishLIstScreen());
                                    break;
                                    default:
                                }
                              },
                              leading: index == 0
                                  ? Icon(Icons.list_alt_outlined)
                                  : index == 1
                                      ? Icon(Icons.favorite)
                                      : Icon(Icons.message),
                              // leading: '${profileiconList[index]}'.text.make(),
                              title: '${profilebuttonList[index]}'.text.make());
                        },
                      )
                          .box
                          .white
                          .roundedSM
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .shadowSm
                          .margin(EdgeInsets.all(10))
                          .make()
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    ));
  }

  void globalmodelsignup() {
    print("model done");
    g_uid = _usersignup.uid;
    g_email = _usersignup.email;
    g_fullname = _usersignup.fullname;
    g_password = _usersignup.password;
    g_phoneno = _usersignup.phoneno;
    g_imageulr = _usersignup.imageulr;
  }
}
