import 'package:e_app/consts/consts.dart';

Widget details({width, String? count, String? title}) {
  return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
          5.heightBox,
          title!.text.fontFamily(semibold).color(darkFontGrey).make(),
        ],
      ).box
      .width(width)
      .height(80)
      .padding(EdgeInsets.all(4))
      .white
      .rounded
      .make();
}
