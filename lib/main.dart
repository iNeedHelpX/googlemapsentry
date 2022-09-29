import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlemapsentry/controllers/login_controller.dart';
import 'package:googlemapsentry/globalvars.dart';
import 'package:googlemapsentry/start/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here
    Get.put(LoginController());
  });
  runApp(Start());
}
