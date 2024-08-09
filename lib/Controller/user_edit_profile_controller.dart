import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personal_finace_management/static_data.dart';

class UserProfileController extends GetxController {
  static UserProfileController get to => Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passToggle = false;
  String? image;
  File? file;
  String link = "";
  initalizedata() {
    name.text = StaticData.usermodel!.name;
    email.text = StaticData.usermodel!.email;
    password.text = StaticData.usermodel!.password;
    image = StaticData.usermodel!.image;
    update();
  }

  XFile? hpickedFile;

  pickImage(ImageSource source) async {
    var pickedImage = await ImagePicker().pickImage(source: source);
    update();
    if (pickedImage != null) {
      hpickedFile = pickedImage;
      update();
    }
    print("xfileimage$hpickedFile");
    return hpickedFile;
  }

  Future<void> updateprofile() async {
    if (hpickedFile != null) {
      await uploadImage(StaticData.usermodel!.id.toString()).then((value) {
        changeEmailAndPassword(email.text, password.text).then((value1) {
          StaticData.firebase
              .collection("user")
              .doc(StaticData.usermodel!.id.toString())
              .update({
            "name": name.text,
            "email": email.text,
            "password": password.text,
            "image": value
          });
        }).then((value) {
          StaticData.updateuserprofile().then((value) {
            initalizedata();
          });
        });
      });
    } else {
      changeEmailAndPassword(email.text, password.text).then((value1) {
        StaticData.firebase
            .collection("user")
            .doc(StaticData.usermodel!.id.toString())
            .update({
          "name": name.text,
          "email": email.text,
          "password": password.text,
        });
        print("update data");
      }).then((value) {
        StaticData.updateuserprofile().then((value) {
          initalizedata();
        });
      });
    }
  }

  Future<String> uploadImage(String id) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child("user").child(id);

      UploadTask uploadTask;
      if (kIsWeb) {
        uploadTask = ref.putData(
            await hpickedFile!.readAsBytes(),
            SettableMetadata(
              contentType: 'image/jpeg',
            ));
      } else {
        uploadTask = ref.putData(
          await hpickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'),
        );
      }

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      if (taskSnapshot.state == TaskState.success) {
        var url = await ref.getDownloadURL();
        print("3333333333333/link");
        link = url;
      } else {
        Fluttertoast.showToast(
          msg: "Image upload failed!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {
      print("error/${e.toString()}");
      Fluttertoast.showToast(
        msg: "Image upload error: /e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
    return link;
  }

  Future<void> changeEmailAndPassword(
      String newEmail, String newPassword) async {
    try {
      User? user = StaticData.auth.currentUser;

      if (user != null) {
        await user.updateEmail(newEmail);
        print("Email updated successfully to $newEmail");

        await user.updatePassword(newPassword);
        print("Password updated successfully");
      } else {
        print("User not signed in.");
      }
    } catch (error) {
      print("Error updating email and password: $error");
    }
  }
}
