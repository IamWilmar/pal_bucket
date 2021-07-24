// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'package:equatable/equatable.dart';
import 'dart:convert';

class AuthResponse {
  AuthResponse({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  bool ok;
  Usuario usuario;
  String token;

  AuthResponse copyWith({
    bool? ok,
    Usuario? usuario,
    String? token,
  }) =>
      AuthResponse(
        ok: ok ?? this.ok,
        usuario: usuario ?? this.usuario,
        token: token ?? this.token,
      );

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        ok: json["ok"],
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "usuario": usuario.toMap(),
        "token": token,
      };
}

class Usuario extends Equatable {
  Usuario({
    this.speakLanguage,
    this.learnLanguage,
    this.biography,
    this.photo,
    this.gender,
    this.age,
    this.nombre,
    this.email,
    this.uid,
  });

  final String? speakLanguage;
  final String? learnLanguage;
  final String? biography;
  final String? photo;
  final String? gender;
  final int? age;
  final String? nombre;
  final String? email;
  final String? uid;

  Usuario copyWith({
    String? speakLanguage,
    String? learnLanguage,
    String? biography,
    String? photo,
    String? gender,
    int? age,
    String? nombre,
    String? email,
    String? uid,
  }) =>
      Usuario(
        speakLanguage: speakLanguage ?? this.speakLanguage,
        learnLanguage: learnLanguage ?? this.learnLanguage,
        biography: biography ?? this.biography,
        photo: photo ?? this.photo,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        nombre: nombre ?? this.nombre,
        email: email ?? this.email,
        uid: uid ?? this.uid,
      );

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        speakLanguage: json["speak_language"],
        learnLanguage: json["learn_language"],
        biography: json["biography"],
        photo: json["photo"],
        gender: json["gender"],
        age: json["age"],
        nombre: json["nombre"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        if (speakLanguage != null) "speak_language": speakLanguage,
        if (learnLanguage != null) "learn_language": learnLanguage,
        if (biography != null) "biography": biography,
        if (photo != null) "photo": photo,
        if (gender != null) "gender": gender,
        if (age != null) "age": age,
        if (nombre != null) "nombre": nombre,
        if (email != null) "email": email,
        if (uid != null) "uid": uid,
      };

  @override
  List<Object?> get props => [
        speakLanguage,
        learnLanguage,
        biography,
        photo,
        gender,
        age,
        nombre,
        email,
        uid,
      ];
}
