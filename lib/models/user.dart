// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:job_portal_frontend/models/application.dart';

class User {
  String? id;
  String name;
  String email;
  String password;
  List<Application>? applicationList;
  List<String>? roles;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.applicationList,
    this.roles,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'applicationList': applicationList?.map((x) => x.toMap()).toList(),
      'roles': roles,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      applicationList: map['applicationList'] != null ? List<Application>.from((map['applicationList'] as List<int>).map<Application?>((x) => Application.fromMap(x as Map<String,dynamic>),),) : null,
      roles: map['roles'] != null ? List<String>.from((map['roles'] as List<String>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    List<Application>? applicationList,
    List<String>? roles,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      applicationList: applicationList ?? this.applicationList,
      roles: roles ?? this.roles,
    );
  }
}
