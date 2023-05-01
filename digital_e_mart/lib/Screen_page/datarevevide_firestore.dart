import 'package:digital_e_mart/model%20copy/usersignup_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class datareceived extends StatefulWidget {
  const datareceived({super.key});

  @override
  State<datareceived> createState() => _datareceivedState();
}

class _datareceivedState extends State<datareceived> {
  User? user = FirebaseAuth.instance.currentUser;
  UserSignupModel _usersignup = UserSignupModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("userss")
        .doc(user!.uid)
        .get()
        .then((value) => _usersignup = UserSignupModel.fromMap(value.data()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firestoredata reveived"),
      ),
      body: Column(
        children: [Text("${_usersignup.uid}")],
      ),
    );
  }
}
