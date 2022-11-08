import 'package:flutter/material.dart';
import 'package:prankvideo/constant/constant.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(backGroundScreen),
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Color(backgroundColor),
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height:80.0,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mealImage.length,
              itemBuilder: (BuildContext context,int index){
                return Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: InkWell(
                      onTap: (){},
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                mealImage[index],
                                height: 65,
                                width: 65,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    mealName[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            )
        ),
      ));
  }
}
