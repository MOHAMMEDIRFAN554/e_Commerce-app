import 'package:e_app/consts/consts.dart';
import 'package:e_app/views/category_screen/item_details.dart';
import 'package:e_app/widegts/bg.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(title: title!.text.fontFamily(bold).white.make()),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) =>
                        "baby Clothing".text
                            .size(12)
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .makeCentered()
                            .box
                            .white
                            .size(120, 60)
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .rounded
                            .make(),
                  ),
                ),
              ),
              10.heightBox,
              //item container
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              height: 150,
                              width: 190,
                              fit: BoxFit.cover,
                            ),
                            "Laptop 8GB/500GB".text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.heightBox,
                            "\$600".text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          ],
                        ).box.white
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .roundedSM
                        .outerShadowSm
                        .padding(EdgeInsets.all(12))
                        .make()
                        .onTap(() {
                          Get.to(() => ItemDetails(title: "title"));
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
