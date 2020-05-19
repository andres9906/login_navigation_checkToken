import 'package:login_navigation/models/professor.dart';
import 'package:login_navigation/models/student.dart';

class Course{
  final int id;
  final String name;
  final String professor;
  final int students;
  final Professor professorObj;
  List<Student> studentsObj;

  Course({this.id,this.name,this.professor,this.students, this.professorObj, this.studentsObj});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      professor: json['professor'],
      students: json['students'],
    );
  }

  factory Course.fromJson2(Map<String, dynamic> json) {
    var list = json['students'] as List;
    List<Student> studentList = list.map((i) => Student.fromJson(i)).toList();
    return Course(
      name: json['name'],
      professorObj: Professor.fromJson(json['professor']),
      studentsObj: studentList,
    );
  }
  

  

  
}
