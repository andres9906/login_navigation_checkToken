
import 'package:login_navigation/models/student.dart';
import 'package:login_navigation/services/student_services.dart';

class Students{

  Future<List<Student>> fetchStudents(String username, String token)async {
    return await StudentService().getStudents(username, token);
  }


  // Future<Student> addCourse(String username, String token)async {
  //   return await StudentService().(username, token);
  // }







}