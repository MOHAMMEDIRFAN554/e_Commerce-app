import 'dart:io';

import 'package:e_app/consts/consts.dart';
import 'package:e_app/consts/images.dart';
import 'package:e_app/controller/profile_controller.dart';
import 'package:e_app/widegts/bg.dart';
import 'package:e_app/widegts/button.dart';
import 'package:e_app/widegts/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () =>
              Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      data['imageUrl'] == '' &&
                              controller.profileImgPath.isEmpty
                          ? Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                          : data['imageUrl'] != '' &&
                              controller.profileImgPath.isEmpty
                          ? Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.heightBox,
                      pressButton(
                        color: redColor,
                        onPress: () {
                          controller.changeImage(context);
                        },
                        textColor: whiteColor,
                        title: "Change",
                      ),
                      Divider(),
                      20.heightBox,
                      customTextField(
                        controller: controller.nameController,
                        hint: nameHint,
                        title: name,
                        isPass: false,
                      ),
                      customTextField(
                        controller: controller.passcontroller,
                        hint: passwordHint,
                        title: password,
                        isPass: true,
                      ),
                      20.heightBox,
                      controller.isloading.value
                          ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                          : SizedBox(
                            width: context.screenWidth - 40,
                            child: pressButton(
                              color: redColor,
                              onPress: () async {
                                controller.isloading(true);
                                await controller.uploadProfileImage();
                                await controller.updateProfile(
                                  imgUrl: controller.profileImageLink,
                                  name: controller.nameController.text,
                                  password: controller.passcontroller.text,
                                );
                                VxToast.show(
                                  context,
                                  msg: "Updated Successfully",
                                );
                              },
                              textColor: whiteColor,
                              title: "Save",
                            ),
                          ),
                    ],
                  ).box.white.shadowSm.rounded
                  .padding(EdgeInsets.all(16))
                  .margin(EdgeInsets.only(top: 50, right: 12, left: 12))
                  .make(),
        ),
      ),
    );
  }
}
