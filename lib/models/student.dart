import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'student.g.dart';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));
String studentToJson(Student data) => json.encode(data.toJson());

@JsonSerializable()
class Student {
  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  Student({required this.count, this.next, this.previous, required this.results});
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable()
class Result {
  final int id;
  final String registration_num;
  final double total_num;
  final String grade;
  final int year;

  Result(
      {required this.id,
      required this.registration_num,
      required this.total_num,
      required this.grade,
      required this.year});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
