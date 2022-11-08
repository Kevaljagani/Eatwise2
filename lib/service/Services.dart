
import 'dart:io';

import 'package:simple_s3/simple_s3.dart';

import '../constant/SharedPrefService.dart';

class Services {
  SimpleS3 _simpleS3 = SimpleS3();

  Future uploadImage({path123}) async {
    try {
      String? result;

      print("try upload ->$path123");
      result = await _simpleS3.uploadFile(
        File(path123),
        "harshankbucket",
        "ap-northeast-1:d84d43c2-b5b3-4b1a-971b-a7b548b61c93",
        AWSRegions.apNorthEast1,
        debugLog: true,
        s3FolderPath: "images",
        useTimeStamp: true,
        accessControl: S3AccessControl.private,
      );
      if (result != null) {
        SharedPrefService().setString(result,'lastUploaded');

        print("result not null ${result}");
      }
    } catch (e,stack) {
      print("Errororor " + e.toString());
      print("Stack -> $stack");
    }

    print("The Reuquest is been Send}");

    // return data;
  }
}
