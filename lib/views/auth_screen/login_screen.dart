import 'package:e_app/consts/consts.dart';
import 'package:e_app/consts/lists.dart';
import 'package:e_app/controller/auth_controller.dart';
import 'package:e_app/views/auth_screen/sinup_screen.dart';
import 'package:e_app/views/home_screen/home.dart';
// import 'package:e_app/consts/strings.dart';
import 'package:e_app/widegts/applogo.dart';
import 'package:e_app/widegts/bg.dart';
import 'package:e_app/widegts/button.dart';
import 'package:e_app/widegts/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:e_app/consts/lists.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(22).make(),
              10.heightBox,
              Column(
                    children: [
                      customTextField(
                        hint: emailHint,
                        title: email,
                        isPass: false,
                        controller: controller.emailController,
                      ),
                      customTextField(
                        hint: passwordHint,
                        title: password,
                        isPass: true,
                        controller: controller.passwordController,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetpass.text.make(),
                        ),
                      ),
                      5.heightBox,
                      //pressButton().box.width(context.screenWidth - 50).make(),
                      pressButton(
                        color: redColor,
                        title: login,
                        textColor: textfieldGrey,
                        onPress: () async {
                          await controller.loginMethod(context: context).then((
                            value,
                          ) {
                            if (value != null) {
                              VxToast.show(context, msg: loginSuccess);
                              Get.offAll(() => Home());
                            } else {
                              VxToast.show(context, msg: loginError);
                            }
                          });
                        },
                      ).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      createNewAccount.text.color(fontGrey).make(),
                      5.heightBox,
                      pressButton(
                        color: redColor,
                        title: signup,
                        textColor: textfieldGrey,
                        onPress: () {
                          Get.to(() => SinupScreen());
                        },
                      ).box.width(context.screenWidth - 40).make(),
                    ],
                  ).box.white.rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 40)
                  .shadowSm
                  .make(),

              10.heightBox,
              loginwith.text.color(fontGrey).make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundColor: lightGrey,
                      radius: 25,
                      child: Image.asset(socaialIconList[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
