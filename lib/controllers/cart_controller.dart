import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlemapsentry/globalvars.dart';
import 'package:googlemapsentry/models/user_model.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  //cart controller for the shopping cart

  // runs at the start
  @override
  void onReady() {
    super.onReady();
  }
}
