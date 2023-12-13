import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/User_Model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> lstuser = [];

  Future<List<UserModel>> getuserapi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        lstuser.add(UserModel.fromJson(i));
      }
      return lstuser;
    } else {
      return lstuser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Api"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: getuserapi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: lstuser.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Id :- ${lstuser[index].id.toString()}"),
                          Text("Name :- ${lstuser[index].name.toString()}"),
                          Text(
                              "Username :- ${lstuser[index].username.toString()}"),
                          Text("Email :- ${lstuser[index].email.toString()}"),
                          const Text(
                            "Address :- ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          Text(
                              "    Street :- ${lstuser[index].address?.street.toString()}"),
                          Text(
                              "    Suite :- ${lstuser[index].address?.suite.toString()}"),
                          Text(
                              "    City :- ${lstuser[index].address?.city.toString()}"),
                          Text(
                              "    ZipCode :- ${lstuser[index].address?.zipcode.toString()}"),
                          const Text(
                            "    Geo :-",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                              "        lat :- ${lstuser[index].address?.geo?.lat.toString()}"),
                          Text(
                              "        lng :- ${lstuser[index].address?.geo?.lng.toString()}"),
                          Text("Phone :- ${lstuser[index].phone.toString()}"),
                          Text(
                              "Website :- ${lstuser[index].website.toString()}"),
                          const Text(
                            "Company :- ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          Text(
                              "    name :- ${lstuser[index].company?.name.toString()}"),
                          Text(
                              "    catchphrase :- ${lstuser[index].company?.catchPhrase.toString()}"),
                          Text(
                              "    bs :- ${lstuser[index].company?.bs.toString()}"),
                        ],
                      ),
                    ),
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
