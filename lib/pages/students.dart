import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/students_controller.dart';
import 'package:login_navigation/models/student.dart';
import 'package:provider/provider.dart';

class StudentsView extends StatefulWidget{
  @override
  _StudentsViewState createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);

    if(students.length == 0){
      getStudents(pro.user.username, pro.user.token);
      print(students.length);
    }

    return Scaffold(
      body: studentList(),
    );
  }

  List<Student> students = new List<Student>();

  getStudents(String username, String token) async {
    List<Student> tempS = await Students().fetchStudents(username, token);
    if(mounted){
      setState(() {
          this.students.addAll(tempS);
      });
    }
        
  }

  Widget studentList() {
    return ListView.builder(
      itemCount: this.students.length,
      itemBuilder: (context, index){
        final name = this.students[index].name;
        final email = this.students[index].email;
        print("ADDIIINNGGG");
        return item(name, email);
      },
    );
  }

  Widget item(String name, String email){
    return Card(
      child:ListTile(
        title: Text(name),
        subtitle: Text("Email: $email"),
      ),
    );
  }
}