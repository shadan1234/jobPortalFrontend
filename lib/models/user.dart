// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:job_portal_frontend/models/application.dart';

class User {
  String? id;
  String name;
  String email;
  String? password;
  List<Application>? applicationList;
  List<String>? roles;
  
  

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.applicationList,
    required this.roles,
   
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'applicationList': applicationList?.map((x) => x.toMap()).toList(),
      'roles': roles as List ,
      
    };
  }

factory User.fromMap(Map<String, dynamic> map) {
   
  return User(
    id: map['id'] as String?,
    name: map['name'] as String,
    email: map['email'] as String,
    password: map['password'] as String,
    applicationList: map['applicationList'] != null 
        ? List<Application>.from((map['applicationList'] as List).map((x) => Application.fromMap(x)))
        : [],
    roles: map['roles'] != null ? List<String>.from(map['roles']) : [],
    
  );

}

String toJson() => json.encode(toMap());

factory User.fromJson(String source) {
  return User.fromMap(json.decode(source) as Map<String, dynamic>);
}


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
      
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, applicationList: $applicationList, roles: $roles)';
  }

}
