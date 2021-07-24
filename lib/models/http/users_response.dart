// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromMap(jsonString);

import 'dart:convert';

import 'package:pal_bucket/models/http/user.dart';

class UsersResponse {
  UsersResponse({
    required this.total,
    required this.users,
  });

  int total;
  List<User> users;

  UsersResponse copyWith({
    int? total,
    List<User>? users,
  }) =>
      UsersResponse(
        total: total ?? this.total,
        users: users ?? this.users,
      );

  factory UsersResponse.fromJson(String str) =>
      UsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        total: json["total"],
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
      };
}
