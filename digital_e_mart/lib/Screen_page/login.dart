import 'package:digital_e_mart/Screen_page/datarevevide_firestore.dart';
import 'package:digital_e_mart/Screen_page/forgetpassword.dart';
import 'package:digital_e_mart/Screen_page/home_screen.dart';
import 'package:digital_e_mart/Screen_page/sign_up.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/home.dart';
import 'package:digital_e_mart/main.dart';
import 'package:digital_e_mart/widget_comom/text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final TextEditingController _loginemail = TextEditingController();
  final TextEditingController _loginpassword = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false; //loading function
  bool _visibal = true;
  final _formKey = GlobalKey<FormState>(); //form key
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
                Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.6,
                ).box.roundedFull.make(),
                "LOGIN".text.size(30).fontFamily(bold).make(),
                "Login to your Account".text.fontFamily(bold).make(),
                10.heightBox,
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 149, 146, 146)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text_field(
                          Obcuretext: false,
                          Controllar: _loginemail,
                          textname: "E-Mail",
                          hitname: 'Please Enter Your E_Mail address',
                          preficicon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter fullname';
                            } else if (value.length < 4) {
                              return 'at least enter 4 characters';
                            } else if (value.length > 19) {
                              return 'maximum character is 13';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text_field(
                            Obcuretext: _visibal,
                            Controllar: _loginpassword,
                            textname: "Password",
                            hitname: 'Please Enter Your Password',
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
                        ),
                        10.heightBox,
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ).onTap(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword1(),
                                ));
                          }),
                        ),
                        30.heightBox,
                        (isLoading)
                            ? CircularProgressIndicator()
                            : SizedBox(
                                //loaging function apply in button size boz than its run button name hide
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      onPressed: () async {
                                        try {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // ... Navigate To your Home Page
                                            setState(() {
                                              isLoading = true;
                                            });
                                            await _auth
                                                .signInWithEmailAndPassword(
                                                    email: _loginemail.text,
                                                    password:
                                                        _loginpassword.text);
                                            isLoading = false;
                                            print("data sent");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Home(),
                                                ));
                                          }
                                        } catch (e) {
                                          setState(() {
                                            isLoading = true;
                                            isLoading = false;
                                          });
                                          print(e);
                                          VxToast.show(context,
                                              msg: e.toString());
                                        }
                                      },
                                      child: "Login".text.size(18).make()),
                                )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't Have an Account."),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Signup(),
                                      ));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Login with",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        Color.fromARGB(255, 147, 143, 143),
                                    child: Image.asset(
                                      icFacebookLogo,
                                      width: 40,
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        Color.fromARGB(255, 147, 143, 143),
                                    child: Image.asset(
                                      icGoogleLogo,
                                      width: 40,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Color.fromARGB(255, 147, 143, 143),
                                  child: Image.asset(
                                    "assets/images/tiwitter.png",
                                    width: 40,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
