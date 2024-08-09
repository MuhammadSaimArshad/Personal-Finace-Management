import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_finace_management/Model/add_income_model.dart';

class IncomeScreenController extends GetxController {
  static IncomeScreenController get to => Get.find();
  TextEditingController search = TextEditingController();
  String qury = "";
  updateQure(String q) {
    qury = q;
    searchdata(q);
    update();
  }

  List<AddIncome> list = [];
  List<AddIncome> fuilterlist = [];
//   fuilterdata(String q){
// fuilter = [];

//   }
  Future<void> searchdata(String query) async {
    fuilterlist.clear();

    if (query.isEmpty && query == "") {
      fuilterlist.addAll(list);
    } else {
      query = query.toLowerCase();

      fuilterlist = list.where((item) {
        return item.source.toLowerCase().contains(query);
      }).toList();

      // print(fuilterlist.length);
      update();
    }
  }
}
