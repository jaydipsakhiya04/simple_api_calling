import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/Photos_Model.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  /// Calling API

  List<PhotoModel> lstPostModel = [];

  Future<List<PhotoModel>> getApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        lstPostModel.add(PhotoModel.fromJson(i));
      }
      return lstPostModel;
    } else {
      return lstPostModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(lstPostModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Api Example"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: getApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: lstPostModel.length,
                itemBuilder: (context, index) {
                  // return Text(index.toString());
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title:
                          Text("Id :- ${lstPostModel[index].id.toString()}"),
                      subtitle: Text(
                          "Title :- ${lstPostModel[index].title.toString()}"),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(lstPostModel[index].url.toString()),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Data Loading..."),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
