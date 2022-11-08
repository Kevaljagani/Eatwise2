import 'package:flutter/material.dart';
import 'package:prankvideo/constant/constant.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(backGroundScreen),
      appBar: AppBar(
        backgroundColor: Color(backgroundColor),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontFamily: "Poppins Bold", fontSize: 20),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: profileName.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(profileIcon[index], color: Colors.white),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        profileName[index],
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins Bold",
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_rounded, color: Colors.lightGreen),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
