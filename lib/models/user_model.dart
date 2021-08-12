// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class User {
  User({
    required this.user,
    required this.pass,
    this.id,
  });

  String user;
  String pass;
  String? id;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        user: json["user"],
        pass: json["pass"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "pass": pass,
      };

  User copy() => User(
        user: this.user,
        pass: this.pass,
        id: this.id,
      );
}