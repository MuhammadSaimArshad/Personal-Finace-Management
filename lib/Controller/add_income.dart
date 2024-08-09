import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:personal_finace_management/Model/add_income_model.dart';

import 'package:uuid/uuid.dart';

class ADDIncomeDetail extends GetxController {
  static ADDIncomeDetail get to => Get.find();
  TextEditingController amount = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController source = TextEditingController();

  addincomedetail(context) {
    var firestore = FirebaseFirestore.instance;
    var uuid = Uuid();
    String id = uuid.v4();

    AddIncome model = AddIncome(
      id: id,
      source: source.text,
      time: time.text,
      amount: double.tryParse(amount.text) ?? 0.0,
    );

    firestore.collection("income").doc(id).set(model.toMap());
    Fluttertoast.showToast(
      msg: "Income Detail Add Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    return "";
  }

  void addexpensedetail(BuildContext context) {}
}
