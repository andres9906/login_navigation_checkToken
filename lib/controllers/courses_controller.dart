import 'package:login_navigation/models/course.dart';
import 'package:login_navigation/services/course_services.dart';

class Courses{
  Future<Course> addCourse(String username, String token)async {
    return await CourseService().createCourse(username, token);
  }

  Future<List<Course>> fetchCourses(String username, String token)async {
    return await CourseService().getCourses(username, token);
  }
}