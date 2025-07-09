import 'package:e_app/consts/consts.dart';
// import 'package:velocity_x/velocity_x.dart';

Widget pressButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.all(12),
    ),
    onPressed: onPress,

    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
