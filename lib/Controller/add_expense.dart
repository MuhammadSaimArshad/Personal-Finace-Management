import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:personal_finace_management/Model/add_expnse_model.dart';

import 'package:uuid/uuid.dart';

class ADDExpenseDetail extends GetxController {
  static ADDExpenseDetail get to => Get.find();
  TextEditingController amount = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController time = TextEditingController();

  addexpensedetail(context) {
    var firestore = FirebaseFirestore.instance;
    var uuid = Uuid();
    String id = uuid.v4();

    AddExpense model = AddExpense(
      id: id,
      source: source.text,
      time: time.text,
      amount: double.tryParse(amount.text) ?? 0.0,
    );

    firestore.collection("expense").doc(id).set(model.toMap());
    Fluttertoast.showToast(
      msg: "Expense Detail Add Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    return "";
  }
}
