import 'dart:convert';

class Model {
 static Model modelFromJson(String str) => Model.fromJson(json.decode(str));
 late int userId;
 late int id;
 late String title;
 late String body;

  Model({ required this.userId, required this.id, required this.title, required this.body});

  Model.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}