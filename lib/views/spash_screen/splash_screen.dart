import 'package:e_app/consts/colors.dart';
import 'package:e_app/consts/consts.dart';
import 'package:e_app/views/auth_screen/login_screen.dart';
import 'package:e_app/views/home_screen/home.dart';
import 'package:e_app/views/home_screen/home_screen.dart';
import 'package:e_app/widegts/applogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // method for changing screen

  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.to(() => LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => LoginScreen());
        } else {
          Get.to(() => Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            CircularProgressIndicator(strokeWidth: 6.0, color: whiteColor),

            50.heightBox,
          ],
        ),
      ),
    );
  }
}
