import 'package:digital_e_mart/Screen_page/login.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/controllar/auth_controllar.dart';
import 'package:digital_e_mart/main.dart';
import 'package:digital_e_mart/widget_comom/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';

import '../model copy/usersignup_model.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneno = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false; //loading function
  final _formKey = GlobalKey<FormState>(); //form key
  bool _visibal = true;
  var controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Text("Create an Account"),
                SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Text_field(
                    textname: 'Full Name',
                    hitname: 'Please enter your full name',
                    Controllar: _fullname,
                    Obcuretext: false,
                    preficicon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    Validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter fullname';
                      } else if (value.length < 4) {
                        return 'at least enter 4 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text_field(
                      textname: 'E-Mail',
                      hitname: 'Please enter your email address',
                      Controllar: _email,
                      Obcuretext: false,
                      preficicon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      Validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter gmail';
                        } else if (!value.endsWith('@gmail.com')) {
                          return 'please enter valid gmail';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text_field(
                    textname: 'Phone no',
                    hitname: 'Please enter phone no',
                    Controllar: _phoneno,
                    preficicon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    Obcuretext: false,
                    Validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 13) {
                        return 'at least enter 13 number';
                      } else if (value.length > 15) {
                        return 'maximum character is 15';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text_field(
                    textname: 'Password',
                    hitname: 'Please enter password',
                    Controllar: _password,
                    preficicon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    suffixicon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _visibal = !_visibal;
                          });
                        },
                        child: Icon(_visibal
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    Obcuretext: _visibal,
                    Validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 7) {
                        return 'at least enter 6 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text_field(
                    textname: 'Re-Password',
                    hitname: 'Please enter Re_password ',
                    Controllar: _repassword,
                    preficicon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    suffixicon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _visibal = !_visibal;
                          });
                        },
                        child: Icon(_visibal
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    Obcuretext: false,
                    Validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 7) {
                        return 'at least enter 6 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      return null;
                    },
                  ),
                  20.heightBox,
                  (isLoading)
                      ? CircularProgressIndicator()
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.width * 0.12,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () async {
                              try {
                                if (_formKey.currentState!.validate()) {
                                  // ... Navigate To your Home Page
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await auth
                                      .createUserWithEmailAndPassword(
                                          email: _email.text,
                                          password: _password.text)
                                      .then((value) {
                                    return controller.storeUserdata(
                                        email: _email.text,
                                        password: _password.text,
                                        name: _fullname.text,
                                        phoneno: _phoneno.text);
                                  }).then((value) {
                                    Get.offAll(Home_Page());
                                  });

                                  User? user = auth.currentUser;
                                  UserSignupModel _usersignup =
                                      UserSignupModel();
                                  FirebaseFirestore firebaseFirestore =
                                      FirebaseFirestore.instance;
                                  _usersignup.uid = user!.uid;
                                  _usersignup.fullname = _fullname.text;
                                  _usersignup.email = _email.text;
                                  _usersignup.phoneno = _phoneno.text;
                                  _usersignup.password = _password.text;
                                  firebaseFirestore
                                      .collection("No of buyer signup")
                                      .doc(user.uid)
                                      .set(_usersignup.toMap());
                                  isLoading = false;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => login_page(),
                                      ));
                                }
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                print(e);
                                print("======================");
                              }
                            },
                            child: "Sign Up".text.size(18).make(),
                          )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I Have an Account."),
                        Text(
                          "Logiin",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20),
                        ).onInkTap(() {
                          Get.to(() => login_page());
                        })
                      ],
                    ),
                  ),
                ])
                    .box
                    .color(Colors.grey)
                    .padding(EdgeInsets.all(16))
                    .roundedSM
                    .width(360)
                    // .width(context.screenWidth - 60)
                    .height(570)
                    // .height(context.screenHeight - 800)
                    .shadowSm
                    .makeCentered(),
                // 20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
