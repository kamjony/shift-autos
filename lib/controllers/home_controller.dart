import 'package:get/get.dart';
import 'package:shift_autos/constants/app_constants.dart';
import 'package:shift_autos/controllers/auth_controller.dart';

class HomeController extends GetxController{
  final AuthController authController = Get.find();
  final user = firebaseAuth.currentUser!;

  @override
  void onInit() {
    super.onInit();
    authController.getFirestoreUser();
  }
}