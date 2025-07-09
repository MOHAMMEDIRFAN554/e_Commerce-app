import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/consts/consts.dart';
import 'package:e_app/consts/lists.dart';
import 'package:e_app/controller/auth_controller.dart';
import 'package:e_app/controller/profile_controller.dart';
import 'package:e_app/services/firestore_services.dart';
import 'package:e_app/views/auth_screen/login_screen.dart';
import 'package:e_app/views/profile_screen/components/details.dart';
import 'package:e_app/views/profile_screen/edit_profile_screen.dart';
import 'package:e_app/widegts/bg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    // Check if user is null
    if (currentUser == null) {
      return bgWidget(
        child: Scaffold(body: Center(child: "User not logged in".text.make())),
      );
    }

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            // Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            }

            // Error state
            if (snapshot.hasError) {
              return Center(
                child: Text("Something went wrong: ${snapshot.error}"),
              );
            }

            // No user data
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No user data found"));
            }

            var data = snapshot.data!.docs[0];

            return SafeArea(
              child: Column(
                children: [
                  // edit profile
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.edit, color: whiteColor),
                    ).onTap(() {
                      controller.nameController.text = data['name'] ?? '';
                      controller.passcontroller.text = data['password'] ?? '';

                      Get.to(() => EditProfileScreen(data: data));
                    }),
                  ),
                  //user details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(
                              imgProfile2,
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                              data['imageUrl'],
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}".text
                                  .fontFamily(semibold)
                                  .white
                                  .make(),
                              "${data['email']}".text.white.make(),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: whiteColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            await Get.put(
                              AuthController(),
                            ).signoutMethod(context);
                            Get.offAll(() => LoginScreen());
                          },
                          child: logout.text.fontFamily(semibold).white.make(),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      details(
                        width: context.screenWidth / 3.5,
                        count: data['cart_count'] ?? "00",
                        title: "In Your Cart",
                      ),
                      details(
                        width: context.screenWidth / 3.5,
                        count: data['order_count'] ?? "00",
                        title: "In Your Orders",
                      ),
                      details(
                        width: context.screenWidth / 3.5,
                        count: data['wishlist_count'] ?? "00",
                        title: "In Your Wishlist",
                      ),
                    ],
                  ),
                  20.heightBox,
                  ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder:
                            (context, index) => Divider(color: lightGrey),
                        itemCount: profileButtonList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonIconList[index],
                              width: 22,
                            ),
                            title:
                                profileButtonList[index].text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                          );
                        },
                      ).box.white.rounded
                      .margin(EdgeInsets.all(12))
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
