import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlemapsentry/globalvars.dart';
import 'package:googlemapsentry/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:googlemapsentry/pages/login_pg.dart';
import 'package:googlemapsentry/start/appsetup.dart';

//for authentication/login
class LoginController extends GetxController {
  static LoginController instance = Get.find();

  Rxn<User> fbUser = Rxn<User>();
  final googleSignIn = GoogleSignIn();
  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = UserModel().obs;
  String usersCollection = "weedusers";
  // Rx<UserModel> usrModel = UserModel().obs;

  GoogleSignInAccount? _googleAcc;
  UserModel? _userModel;

  @override
  void onReady() {
    super.onReady();
    fbUser = Rxn<User>(auth.currentUser);
    fbUser.bindStream(auth.userChanges());
    ever(fbUser, setInitialScreen);
  }

  UserModel? get loggedInUserModel => _userModel;

  setInitialScreen(User? user) {
    if (user == null) {
      if (kDebugMode) {
        print("going to login page...");
      }
      Get.offAll(() => LoginPage());
    }
    if (user != null) {
      if (kDebugMode) {
        print("The user is ${user.displayName}");
      }
      userModel.bindStream(listenToUser());
      Get.offAll(() => AppSetup());
    }
  }

  void googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    _googleAcc = googleUser;
    final googleAuth = await googleUser.authentication;

    final cred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await auth.signInWithCredential(cred).then((res) async {
        if (kDebugMode) {
          print('Signed in successfully as ${res.user!.displayName}');
          print('email: ${res.user!.email}');
          print('email: ${res.user!.email}');
        }

        UserModel newUser = UserModel(
          id: res.user!.uid,
          email: res.user!.email!,
          name: res.user!.displayName,
          photoURL: res.user!.photoURL,
          cart: [],
        );
        _addUserToFB(newUser, res.user!);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    googleSignIn.signOut();
    auth.signOut();
  }

  //maybe add clear controllers method?

  updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(fbUser.value!.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(fbUser.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  _addUserToFB(UserModel usr, User firebaseUser) {
    firebaseFirestore.collection(usersCollection).doc().set({
      "displayName": usr.name,
      "id": usr.id,
      "photoURL": usr.photoURL,
      "email": usr.email,
      "cart": usr.cart
    });
  }
}
