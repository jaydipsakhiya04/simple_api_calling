// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../Models/ExerciseModel.dart';
//
// class ExerciseScreen extends StatefulWidget {
//   const ExerciseScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ExerciseScreen> createState() => _ExerciseScreenState();
// }
//
// class _ExerciseScreenState extends State<ExerciseScreen> {
//   ExerciseModel exer = ExerciseModel(data: []);
//
//   Future<ExerciseModel> getapi() async {
//     final response = await http
//         .get(Uri.parse(""));
//     var data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       exer = ExerciseModel.fromJson(data);
//       return exer;
//     } else {
//       return exer;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Exercise Api"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: getapi(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: (exer.data ?? []).length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: Text("Id :- ${(exer.data ?? [])[index].id}"),
//                   );
//                 },
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
