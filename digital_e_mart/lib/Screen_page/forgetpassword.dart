import 'package:digital_e_mart/Screen_page/login.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPassword1 extends StatefulWidget {
  const ForgetPassword1({super.key});

  @override
  State<ForgetPassword1> createState() => _ForgetPassword1State();
}

class _ForgetPassword1State extends State<ForgetPassword1> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _restemailContriller = TextEditingController();
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forgetting password",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 0, 10),
                child: Text("E-mail",
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.13,
              child: TextField(
                controller: _restemailContriller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Please Enter Your E-Mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefix: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            20.heightBox,
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.12,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        resetEmail();
                      },
                      child: Text("Sent code")),
                )),

            // ElevatedButton(onPressed: () {
            //   setState(() {

            //   });
            // }, child: child)
          ],
        ),
      ),
    );
  }

  void resetEmail() {
    try {
      setState(() {
        isloading = true;
      });
      if (_restemailContriller.text.isNotEmpty) {
        _auth.sendPasswordResetEmail(email: _restemailContriller.text);
        Fluttertoast.showToast(msg: "Please check your mailbox");
        setState(() {
          isloading = false;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login_page()));
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
