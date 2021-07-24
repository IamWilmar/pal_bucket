import 'dart:convert';

class User {
  User({
    this.role,
    this.status,
    this.google,
    this.name,
    this.email,
    this.uid,
  });

  String? role;
  bool? status;
  bool? google;
  String? name;
  String? email;
  String? uid;

  User copyWith({
    String? role,
    bool? status,
    bool? google,
    String? name,
    String? email,
    String? uid,
  }) =>
      User(
        role: role ?? this.role,
        status: status ?? this.status,
        google: google ?? this.google,
        name: name ?? this.name,
        email: email ?? this.email,
        uid: uid ?? this.uid,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        role: json["role"],
        status: json["status"],
        google: json["google"],
        name: json["name"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        if (role != null) "role": role,
        if (status != null) "status": status,
        if (google != null) "google": google,
        if (name != null) "name": name,
        if (email != null) "email": email,
        if (uid != null) "uid": uid,
      };
}
