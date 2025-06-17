import 'package:e_app/consts/consts.dart';
import 'package:e_app/views/auth_screen/login_screen.dart';
import 'package:e_app/widegts/applogo.dart';
import 'package:e_app/widegts/bg.dart';
import 'package:e_app/widegts/button.dart';
import 'package:e_app/widegts/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinupScreen extends StatefulWidget {
  const SinupScreen({super.key});

  @override
  State<SinupScreen> createState() => _SinupScreenState();
}

class _SinupScreenState extends State<SinupScreen> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Sign Up to $appname".text.fontFamily(bold).white.size(22).make(),
              10.heightBox,
              Column(
                    children: [
                      customTextField(hint: nameHint, title: name),
                      customTextField(hint: emailHint, title: email),

                      customTextField(hint: passwordHint, title: password),
                      customTextField(hint: rePassHint, title: rePass),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetpass.text.make(),
                        ),
                      ),
                      5.heightBox,

                      //pressButton().box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      Row(
                        children: [
                          Checkbox(
                            checkColor: redColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                          ),
                          5.widthBox,
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: bold,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: bold,
                                      color: redColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and  ",
                                    style: TextStyle(
                                      fontFamily: bold,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                      fontFamily: bold,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      pressButton(
                        color: isCheck == true ? redColor : lightGrey,
                        title: signup,
                        textColor: textfieldGrey,
                        onPress: () {},
                      ).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          alreadyAc.text.color(fontGrey).make(),
                          login.text.color(redColor).make().onTap(() {
                            Get.to(() => LoginScreen());
                          }),
                        ],
                      ),
                    ],
                  ).box.white.rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 40)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
