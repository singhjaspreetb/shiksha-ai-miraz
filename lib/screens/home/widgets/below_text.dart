import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/user_model.dart';

class BelowText extends StatefulWidget {
  const BelowText({Key? key}) : super(key: key);

  @override
  _BelowTextState createState() => _BelowTextState();
}

class _BelowTextState extends State<BelowText> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 25),
        child: RichText(
            text:  TextSpan(children: [
          TextSpan(
              text: "Hello,\n${loggedInUser.firstName}  ${loggedInUser.secondName}",
              style:  const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white))
        ])));
  }
}
