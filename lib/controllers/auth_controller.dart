import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shift_autos/constants/app_constants.dart';
import 'dart:developer' as dev;

import 'package:shift_autos/models/user_model.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  Rxn<UserModel> fireStoreUser = Rxn<UserModel>();

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user?.uid != null) {
      fireStoreUser.bindStream(streamFirestoreUser());
    }

    if (user == null) {
      Get.offAllNamed('/sign_in');
    } else {
      if (user.emailVerified) {
        Get.offAllNamed('/home');
      } else {
        sendEmailVerification();
        Get.offNamed('/verify_email');
      }
    }
  }

  Stream<UserModel> streamFirestoreUser() {
    return firebaseFirestore
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }

  Future<UserModel> getFirestoreUser() {
    return firebaseFirestore
        .doc('/users/${firebaseUser.value!.uid}')
        .get()
        .then((value) => UserModel.fromMap(value.data()!));
  }

  void register(String email, password) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {

        //Create new user
        UserModel _newUser = UserModel(
            uid: result.user!.uid,
            email: result.user!.email!,
            name: 'Default Name',
            photoUrl: 'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50');
        _createUserFirestore(_newUser, result.user!);
      });

    } on FirebaseAuthException catch (e) {
      dev.log(e.toString());
      Get.snackbar('Error', e.message!);
    }
  }

  void _createUserFirestore(UserModel user, User _firebaseUser) {
    firebaseFirestore.doc('/users/${firebaseUser.value!.uid}').set(user.toJson());
    update();
  }

  //updates the firestore user in users collection
  void _updateUserFirestore(UserModel user, User _firebaseUser) {
    firebaseFirestore.doc('/users/${firebaseUser.value!.uid}').update(user.toJson());
    update();
  }

  void login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      dev.log(e.toString());
      Get.snackbar('Error', e.message!);
    }
  }

  void resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset email has been sent!');
    } on FirebaseAuthException catch (e) {
      dev.log(e.toString());
      Get.snackbar('Error', e.message!);
    }
  }

  void sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      dev.log(e.toString());
      Get.snackbar('Error', e.message!);
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
