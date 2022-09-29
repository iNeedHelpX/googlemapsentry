import 'package:flutter/material.dart';
import 'package:googlemapsentry/globalvars.dart';
import 'package:googlemapsentry/start/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here
  });
  runApp(Start());
}
