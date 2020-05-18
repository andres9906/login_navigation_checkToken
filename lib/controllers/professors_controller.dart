
import 'package:login_navigation/models/professor.dart';
import 'package:login_navigation/services/professor_services.dart';

class Professors{

  Future<List<Professor>> fetchProfessors(String username, String token)async {
    return await ProfessorService().getProfessors(username, token);
  }

  Future<Professor> fetchProfessor(String username, String token, int pid)async {
    return await ProfessorService().getProfessor(username, token, pid);
  }


  // Future<Student> addCourse(String username, String token)async {
  //   return await StudentService().(username, token);
  // }







}