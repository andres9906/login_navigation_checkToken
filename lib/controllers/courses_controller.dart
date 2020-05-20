import 'package:flutter/material.dart';
import 'package:login_navigation/models/course.dart';
import 'package:login_navigation/services/course_services.dart';

import 'package:provider/provider.dart';
import 'auth_controller.dart';

class Courses{
  Future<Course> addCourse(String username, String token, BuildContext context)async {
    var prov = Provider.of<Auth>(context);
    prov.checkToken();
    return await CourseService().createCourse(username, token);
  }

  Future<List<Course>> fetchCourses(String username, String token, BuildContext context)async {
    var prov = Provider.of<Auth>(context);
    prov.checkToken();
    return await CourseService().getCourses(username, token);
  }

  Future<Course> fetchCourse(String username, String token, int cid, BuildContext context)async {
    var prov = Provider.of<Auth>(context);
    prov.checkToken();
    return await CourseService().getCourse(username, token, cid);
  }
}