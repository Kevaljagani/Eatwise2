import 'package:flutter/material.dart';
import 'package:prankvideo/constant/constant.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen(
      {Key? key,
      required String videoPath,
      required String name,
      required String number,
      required String image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backGroundScreen),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
