import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({
    this.gender,
    this.role,
    this.status,
    this.google,
    this.name,
    this.email,
    this.image,
    this.age,
    this.description,
    this.country,
    this.uid,
  });

  final String? gender;
  final String? role;
  final bool? status;
  final bool? google;
  final String? name;
  final String? email;
  final String? image;
  final String? age;
  final String? description;
  final String? country;
  final String? uid;

  User copyWith({
    String? gender,
    String? role,
    bool? status,
    bool? google,
    String? name,
    String? email,
    String? image,
    String? age,
    String? description,
    String? country,
    String? uid,
  }) =>
      User(
        gender: gender ?? this.gender,
        role: role ?? this.role,
        status: status ?? this.status,
        google: google ?? this.google,
        name: name ?? this.name,
        email: email ?? this.email,
        image: image ?? this.image,
        age: age ?? this.age,
        description: description ?? this.description,
        country: country ?? this.country,
        uid: uid ?? this.uid,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        gender: json["gender"],
        role: json["role"],
        status: json["status"],
        google: json["google"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        age: json["age"],
        description: json["description"],
        country: json["country"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "gender": gender,
        "role": role,
        "status": status,
        "google": google,
        "name": name,
        "email": email,
        "image": image,
        "age": age,
        "description": description,
        "country": country,
        "uid": uid,
      };

  @override
  List<Object?> get props => [
        gender,
        role,
        status,
        google,
        name,
        email,
        image,
        age,
        description,
        country,
        uid,
      ];
}
