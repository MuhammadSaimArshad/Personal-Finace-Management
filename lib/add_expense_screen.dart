import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_finace_management/Controller/add_expense.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  var height, width;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(ADDExpenseDetail());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<ADDExpenseDetail>(builder: (obj) {
      return Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.2,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Expense Detail",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.001,
                ),
                // 1
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.source,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: width * 0.01,
                        ),
                      ),
                      label: Text(
                        "Source",
                        style: TextStyle(
                            color: Colors.blue, fontSize: width * 0.035),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your  source';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.001,
                ),

                // 2
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.amount,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: width * 0.01,
                        ),
                      ),
                      label: Text(
                        "Amount",
                        style: TextStyle(
                            color: Colors.blue, fontSize: width * 0.035),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Weight';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.001,
                ),

                // 3
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.time,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: width * 0.01,
                        ),
                      ),
                      label: Text(
                        "Time",
                        style: TextStyle(
                            color: Colors.blue, fontSize: width * 0.035),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Time';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: height * 0.001,
                ),
                InkWell(
                  onTap: () {
                    obj.addexpensedetail(context);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.92,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: width * 0.004, color: Colors.white),
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Add Detail",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
