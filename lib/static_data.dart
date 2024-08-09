// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personal_finace_management/Model/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StaticData {
  static String user = "";
  static String admin = "";
  static UserModel? usermodel;
  static String token = "";
  static FirebaseFirestore firebase = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static logout(BuildContext context) async {
    SharedPreferences a = await SharedPreferences.getInstance();
    a.getKeys();
    a.clear();
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const LoginScreen(),
    //     ));
  }

  static Future cleardata(BuildContext context) async {
    SharedPreferences a = await SharedPreferences.getInstance();
    a.getKeys();
    a.clear();
  }

  static updatetokken(String tokken, String id, String collectionname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(collectionname, id);
    StaticData.firebase
        .collection(collectionname)
        .doc(id)
        .update({"token": tokken});
  }

  static Future<void> updateuserprofile() async {
    try {
      DocumentSnapshot snapshot =
          await firebase.collection("user").doc(usermodel!.id).get();
      UserModel model =
          UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      usermodel = model;
    } catch (e) {
      print("errrrrrrror    $e");
      Fluttertoast.showToast(
        msg: "${e.toString()} !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
