import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

//firebase stuff
final Future<FirebaseApp> initialization = Firebase.initializeApp();
//other variables
Logger logger = Logger();
