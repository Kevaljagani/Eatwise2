import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prankvideo/service/Services.dart';
import 'package:prankvideo/view/homeScreen/HomeScreen.dart';

class ServiceController extends GetxController
{
  Services service = Services();
  Future imageProcess(
      {required imagePath}) async {
    try {
      var res = await service.uploadImage(path123: imagePath);
      update();
      loading.value = false;
      Random rnd;
      int min = 60;
      int max = 250;
      rnd = new Random();
      int first = min + rnd.nextInt(max - min);
      int second = min + rnd.nextInt(max - min);
      int third = min + rnd.nextInt(max - min);
      int fourth = min + rnd.nextInt(max - min);
      int fifth = min + rnd.nextInt(max - min);

      calValue.value = [first,second,third,fourth,fifth];
      Get.snackbar("Upload Finished ",
          "Image uploading and Image Analysis to AWS is finished!",
          colorText: Colors.white);
      return res;
    } catch (e) {
      print(e);
    }
  }
}