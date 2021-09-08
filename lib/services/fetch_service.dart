import 'package:flutter/material.dart';

/// Models:
import 'package:dmz_proj_flutter_frontend/models/student.dart';

/// Screens:

/// Widgets:

/// Services:
import 'package:http/http.dart' as http;

/// State:

/// Utils/Helpers:

/// Entry Point:
class FetchService {
  final String uri;

  FetchService({required this.uri});

  // @GET:

  Future<Student?> getAllStudents() async {
    final response = await http.get(Uri.parse(uri));
    try {
      if (response.statusCode == 200) {
        final studentData = studentFromJson(response.body);
        return studentData;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSearchedStudent() async {
    final response = await http.get(Uri.parse(uri));
    try {
      if (response.statusCode == 200) {
        final searchedStudent = studentFromJson(response.body);
        print(searchedStudent.results[0].year);
        // return searchedStudent.results;
      }
    } catch (e) {
      rethrow;
    }
  }
}
