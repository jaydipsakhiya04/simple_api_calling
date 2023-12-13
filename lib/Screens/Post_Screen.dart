import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/Post_Model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel> lstpost = [];

  Future<List<PostModel>> getpostaip() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        lstpost.add(PostModel.fromJson(i));
      }
      return lstpost;
    } else {
      return lstpost;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Example"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: getpostaip(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: lstpost.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Card(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Id :- ${lstpost[index].id.toString()}"),
                          Text("Name :- ${lstpost[index].userId.toString()}"),
                          Text(
                              "Username :- ${lstpost[index].title.toString()}"),
                          Text("Email :- ${lstpost[index].body.toString()}"),
                        ],
                      ),
                    )),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
