
import 'package:flutter/material.dart';
import 'package:login_navigation/models/student.dart';
import 'package:login_navigation/services/student_services.dart';
import 'package:provider/provider.dart';

import 'auth_controller.dart';

class Students{

  Future<List<Student>> fetchStudents(String username, String token, BuildContext context)async {
    var prov = Provider.of<Auth>(context);
    prov.checkToken();        
    return await StudentService().getStudents(username, token);
  }

  Future<Student> fetchStudent(String username, String token, int sid, BuildContext context)async {
    var prov = Provider.of<Auth>(context);
    prov.checkToken();        
    return await StudentService().getStudent(username, token, sid);
  }


  // Future<Student> addCourse(String username, String token)async {
  //   return await StudentService().(username, token);
  // }







}