import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:personal_finace_management/Model/user_model.dart';
import 'package:personal_finace_management/components/bottombar.dart';
import 'package:personal_finace_management/static_data.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserLoginController extends GetxController {
  static UserLoginController get to => Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = "";

  bool passToggle = true;

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential myuser = await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User user = myuser.user!;
      if (user != null) {
        Fluttertoast.showToast(
            msg: "Login Succesfull",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        String id = user.uid;
        // StaticData.patient = id;
        DocumentSnapshot snapshot =
            await firebase.collection("user").doc(id).get();
        if (snapshot.exists) {
          UserModel model =
              UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
          StaticData.usermodel = model;
          update();
          firebase
              .collection("user")
              .doc(id)
              .update({"token": StaticData.token});
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNavbar(),
              ));
          SharedPreferences prefs = await SharedPreferences.getInstance();
          StaticData.cleardata(context).then((value) {
            prefs.setString("user", id);
            clearForm();
          });
        }
      } else {
        update();
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Invalid Email!";
          break;
        case "wrong-password":
          errorMessage = "Wrong Password";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  clearForm() {
    email.clear();
    password.clear();
    update();
  }
}
