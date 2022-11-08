import 'package:flutter/material.dart';
import 'package:get/get.dart';

  var backgroundColor = 0xff323236;
  var backGroundScreen = 0xff262628;

Widget text(
    {text,
    color,
    fontName,
    required double fontSize,
    textAlign,
    letterSpace,
    fontWeight}) {
  return Text(
    '$text',
    style: TextStyle(
      color: color,
      fontFamily: "$fontName",
      fontSize: fontSize,
      letterSpacing: letterSpace,
      fontWeight: fontWeight,
      overflow: TextOverflow.fade,
    ),
    textAlign: textAlign,
    overflow: TextOverflow.fade,
    softWrap: false,
  );
}



void snackBar({required String title, required String description}) {
  Get.snackbar(
    title,
    description,
    icon: const Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color(0xff828282),
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}



List<Color> color =[Colors.green,Colors.blueGrey,Colors.redAccent,Colors.purpleAccent,Colors.indigoAccent];
List<String> name =["Carbs","Cals","Prot","Fat","Fibre"];
List<String> mealName =["Breakfast","Lunch","Dinner","Snacks"];
List<String> mealImage =["assets/image/breakfast.png","assets/image/christmas-dinner.png","assets/image/lunch-time.png","assets/image/apple.png"];


List<String> profileName = ["Buy Unlimited Plan","View My Plan","Got a Question","Nutrient Display","Glucose Display","Targets","Privacy Policy","Terms & Condition","Back & Restore"];
List<IconData> profileIcon = [Icons.rocket,Icons.queue_play_next,Icons.question_mark,Icons.monitor_heart,Icons.settings,Icons.add_circle_outline_sharp,Icons.privacy_tip,Icons.privacy_tip,Icons.reset_tv];

