
import 'package:flutter/material.dart';
import 'package:login_navigation/models/professor.dart';
import 'package:login_navigation/services/professor_services.dart';
import 'package:provider/provider.dart';

import 'auth_controller.dart';

class Professors{

  Future<List<Professor>> fetchProfessors(String username, String token, BuildContext context)async {
    var prov = Provider.of<Auth>(context);
    prov.checkToken();    
    return await ProfessorService().getProfessors(username, token);
  }

  Future<Professor> fetchProfessor(String username, String token, int pid, BuildContext context)async {
    var prov = Provider.of<Auth>(context);
    prov.checkToken();    
    return await ProfessorService().getProfessor(username, token, pid);
  }


  // Future<Student> addCourse(String username, String token)async {
  //   return await StudentService().(username, token);
  // }







}