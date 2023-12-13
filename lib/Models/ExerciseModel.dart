class ExerciseModel {
  bool? status;
  List<Data>? data;

  ExerciseModel({this.status,required this.data});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Data {
  int? id;
  String? image;
  String? title;
  String? subTitle;

  Data({this.id, this.image, this.title, this.subTitle});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    return data;
  }
}
