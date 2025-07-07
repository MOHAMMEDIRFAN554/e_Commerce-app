import 'package:e_app/consts/consts.dart';
import 'package:e_app/consts/lists.dart';
import 'package:e_app/views/profile_screen/components/details.dart';
import 'package:e_app/widegts/bg.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // edit profile
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.edit, color: whiteColor),
                ).onTap(() {}),
              ),
              //user details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "User Name ".text.fontFamily(semibold).white.make(),
                          //5.heightBox,
                          "Email@example.com".text.white.make(),
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
                      onPressed: () {},
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
                    count: "00",
                    title: "In Your Cart",
                  ),
                  details(
                    width: context.screenWidth / 3.5,
                    count: "00",
                    title: "In Your Orders",
                  ),
                  details(
                    width: context.screenWidth / 3.5,
                    count: "00",
                    title: "In Your Wishlist",
                  ),
                ],
              ),
              //buttons
              20.heightBox,
              ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider(color: lightGrey);
                    },
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
                  .padding(EdgeInsetsGeometry.symmetric(horizontal: 16))
                  .shadowSm
                  .make()
                  .box
                  .color(redColor)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
