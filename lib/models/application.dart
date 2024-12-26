// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Application {
  String? id;
  String name;
  String description;
  String resumeUrl;
  String? userId;
  String? empId;

  Application({
    this.id,
    required this.name,
    required this.description,
    required this.resumeUrl,
    this.userId,
    this.empId,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'resumeUrl': resumeUrl,
      'userId': userId,
      'empId': empId,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      resumeUrl: map['resumeUrl'] as String,
      userId: map['userId'] != null ? map['userId'] as String : null,
      empId: map['empId'] != null ? map['empId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) => Application.fromMap(json.decode(source) as Map<String, dynamic>);

  Application copyWith({
    String? id,
    String? name,
    String? description,
    String? resumeUrl,
    String? userId,
    String? empId,
  }) {
    return Application(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      resumeUrl: resumeUrl ?? this.resumeUrl,
      userId: userId ?? this.userId,
      empId: empId ?? this.empId,
    );
  }
}
