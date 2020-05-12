import 'package:login_navigation/models/course.dart';
import 'package:login_navigation/services/webservices.dart';

class Courses{
  Future<Course> addCourse(String username, String token)async {
    return await Webservice().createCourse(username, token);
  }

  Future<List<Course>> fetchCourses(String username, String token)async {
    return await Webservice().getCourses(username, token);
  }
}