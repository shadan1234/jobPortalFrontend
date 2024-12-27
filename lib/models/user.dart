// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:job_portal_frontend/models/application.dart';

class User {
  String? id;
  String name;
  String email;
  String password;
  List<Application>? applicationList;
  List<String>? roles;
  String token;
  

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.applicationList,
    required this.roles,
    required this.token,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'applicationList': applicationList?.map((x) => x?.toMap()).toList(),
      'roles': roles as List ,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      applicationList: map['applicationList'] != null ? List<Application>.from((map['applicationList'] as List<int>).map<Application?>((x) => Application.fromMap(x as Map<String,dynamic>),),) : null,
      roles: map['roles'] != null ? List<String>.from((map['roles'] as List<String>)) : null,
      token: map['token'] as String,
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
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      applicationList: applicationList ?? this.applicationList,
      roles: roles ?? this.roles,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, applicationList: $applicationList, roles: $roles, token: $token)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      listEquals(other.applicationList, applicationList) &&
      listEquals(other.roles, roles) &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      applicationList.hashCode ^
      roles.hashCode ^
      token.hashCode;
  }
}
