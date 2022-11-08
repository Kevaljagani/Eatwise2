import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prankvideo/constant/SharedPrefService.dart';
import 'package:prankvideo/constant/constant.dart';

class ProccessImage extends StatefulWidget {
  const ProccessImage({Key? key}) : super(key: key);

  @override
  State<ProccessImage> createState() => _ProccessImageState();
}

class _ProccessImageState extends State<ProccessImage> {
  RxString? image = ''.obs;

  Future<void> Shared() async {
    image!.value = await SharedPrefService().getString("lastUploaded");
    print("image - > $image");
  }

  @override
  void initState() {
    Shared();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("image!.value - > ${image!.value}");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(backGroundScreen),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(backgroundColor),
        title: const Text(
          "Last Uploaded Image",
          style: TextStyle(color: Colors.white, fontFamily: "Poppins Bold"),
        ),
      ),
      body: Obx(
        () => image!.value != ""
            ? Center(
                child: Container(
                  height: height * 0.6,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Image.network(
                    image!.value,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            : Container(
                child: Center(
                child: Text(
                  "No Image Uploaded",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins Bold",
                      fontSize: 20),
                ),
              )),
      ),
    );
  }
}
