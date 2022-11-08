import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prankvideo/constant/constant.dart';
import 'package:prankvideo/controller/serviceController.dart';
import 'package:prankvideo/view/homeScreen/account.dart';
import 'package:prankvideo/view/homeScreen/searchFood.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenFakeVideoState();
}
RxBool loading = false.obs;

RxList<int> calValue = [0,0,0,0,0].obs;

class _HomeScreenFakeVideoState extends State<HomeScreen> {
  ServiceController controller = Get.put(ServiceController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  RxList selectionItem = [false, false, false, false, false].obs;
  RxInt selectedColor = 0.obs;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                size: 30.0,
              ),
              onPressed: () {
                Get.to(const Account());
              },
              color: Colors.grey,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Color(backgroundColor),
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.white, fontFamily: "Poppins Bold"),
        ),
      ),
      backgroundColor: Color(backGroundScreen),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const SearchFood());
                  },
                  child: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 14.0),
                        hintText: "Food, drinks & ingredients",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Today's meal",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins Bold",
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 25.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.1,
              width: width * 0.91,
              decoration: BoxDecoration(
                color: Color(backgroundColor),
                borderRadius: const BorderRadius.all(Radius.circular(60)),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        selectionItem.value = selectionItem.value
                            .map<bool>((v) => false)
                            .toList();
                        if (selectionItem.value[index] == false) {
                          selectionItem.value[index] = true;
                        }
                        selectedColor.value = selectionItem.value
                            .indexOf(selectionItem.value[index]);
                      },
                      child: Container(
                        width: width * 0.19,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: selectionItem.value[index] == true
                              ? color[index]
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                        calValue.value[index].toString(),
                              style: TextStyle(
                                  color: selectionItem.value[index] == true
                                      ? Colors.white
                                      : color[index],
                                  fontFamily: "Poppins Bold",
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              name[index],
                              style: TextStyle(
                                  color: selectionItem.value[index] == true
                                      ? Colors.white
                                      : color[index],
                                  fontFamily: "Poppins Bold",
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Log a meal",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins Bold",
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 25.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: height * 0.18,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mealImage.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: width * 0.19,
                            height: height * 0.07,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  mealImage[index],
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  mealName[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Bold",
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: height * 0.025,
                                  width: width * 0.08,
                                  decoration: BoxDecoration(
                                      color: color[selectedColor.value],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: const Center(
                                    child: Text(
                                      "0g",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins Bold",
                                          fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Visibility(
                visible: loading.value, child: CircularProgressIndicator())),
            const SizedBox(
              height: 20,
            ),
            _image != null
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Uploaded Image",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins Bold",
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.9,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Insert Image",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins Bold",
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return SafeArea(
                        child: Container(
                          child: new Wrap(
                            children: <Widget>[
                              new ListTile(
                                leading: new Icon(Icons.photo_library),
                                title: new Text('Photo Library'),
                                onTap: () {
                                  _imgFromGallery();
                                  Navigator.of(context).pop();
                                },
                              ),
                              new ListTile(
                                leading: new Icon(Icons.photo_camera),
                                title: new Text('Camera'),
                                onTap: () {
                                  _imgFromCamera();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                color: Colors.white,
                strokeWidth: 1,
                child: SizedBox(
                  height: height * 0.15,
                  width: width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      text(
                        fontSize: 15,
                        color: Colors.white70,
                        text: "Upload Image",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  File? _image;

  _imgFromCamera() async {
    var image = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
      controller.imageProcess(imagePath: _image!.path);
      loading.value = true;
    });
  }

  _imgFromGallery() async {
    var image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
      controller.imageProcess(imagePath: _image!.path);
      loading.value = true;
    });
  }
}
