import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:googlemapsentry/controllers/login_controller.dart';
import 'package:logger/logger.dart';

//firebase stuff
final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

//controller
LoginController loginController = LoginController.instance;

//other variables
Logger logger = Logger();
