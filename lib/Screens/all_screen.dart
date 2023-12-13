import 'package:api_example/Screens/Photos_Screen.dart';
import 'package:api_example/Screens/Post_Screen.dart';
import 'package:api_example/Screens/User_Screen.dart';
import 'package:api_example/Screens/custom_photo_screen.dart';
import 'package:flutter/material.dart';

class All_Screen extends StatefulWidget {
  const All_Screen({Key? key}) : super(key: key);

  @override
  State<All_Screen> createState() => _All_ScreenState();
}

class _All_ScreenState extends State<All_Screen> {
  List<PageModel> pageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageList.add(PageModel(page: const PostScreen(), name: "Post Api Screen"));
    pageList.add(PageModel(page: const UserScreen(), name: "User Api Screen"));
    pageList
        .add(PageModel(page: const PhotoScreen(), name: "Photo Api Screen"));
    pageList.add(PageModel(
        page: const CustomPhotoScreen(), name: "Custom Photo Screen"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Calling App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: pageList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pageList[index].page,
                    ));
              },
              child: Container(
                height: 100,
                margin: const EdgeInsets.symmetric(vertical: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.purple.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  pageList[index].name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PageModel {
  Widget page;
  String name;

  PageModel({required this.page, required this.name});
}
