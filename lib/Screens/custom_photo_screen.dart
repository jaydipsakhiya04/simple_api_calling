import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/custom_photo_model.dart';

class CustomPhotoScreen extends StatefulWidget {
  const CustomPhotoScreen({Key? key}) : super(key: key);

  @override
  State<CustomPhotoScreen> createState() => _CustomPhotoScreenState();
}

class _CustomPhotoScreenState extends State<CustomPhotoScreen> {
  List<Custom_Photo_Model> lstCustomPhoto = [];
  Future<List<Custom_Photo_Model>> getPhoto() async {
    final response =
        http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    return lstCustomPhoto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Photo Screen"),
        centerTitle: true,
      ),
      body: const Center(),
    );
  }
}
