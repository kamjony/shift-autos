import 'package:get/get.dart';
import 'package:shift_autos/pages/auth/forgot_password.dart';
import 'package:shift_autos/pages/auth/sign_in.dart';
import 'package:shift_autos/pages/auth/sign_up.dart';
import 'package:shift_autos/pages/auth/verify_email.dart';
import 'package:shift_autos/pages/home/home.dart';
import 'package:shift_autos/pages/splash.dart';

class AppRoutes{
  AppRoutes._(); //this is to prevent anyone from instantiating this object

  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => Splash()),
    GetPage(name: '/sign_in', page: () => SignIn()),
    GetPage(name: '/sign_up', page: () => SignUp()),
    GetPage(name: '/forgot_password', page: () => ForgotPassword()),
    GetPage(name: '/verify_email', page: () => VerifyEmail()),
    GetPage(name: '/home', page: () => Home()),
  ];
}