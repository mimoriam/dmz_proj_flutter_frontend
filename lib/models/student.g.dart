// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int,
      registration_num: json['registration_num'] as String,
      total_num: (json['total_num'] as num).toDouble(),
      grade: json['grade'] as String,
      year: json['year'] as int,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'registration_num': instance.registration_num,
      'total_num': instance.total_num,
      'grade': instance.grade,
      'year': instance.year,
    };
