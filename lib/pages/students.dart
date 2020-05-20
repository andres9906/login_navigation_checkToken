import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/students_controller.dart';
import 'package:login_navigation/models/student.dart';
import 'package:login_navigation/pages/single_student.dart';
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
    List<Student> tempS = await Students().fetchStudents(username, token, context);
    if(mounted && tempS != null){
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
        // print("ADDIIINNGGG");
        return item(this.students[index]);
      },
    );
  }

  Widget item(Student s){
    return Card(
      child:ListTile(
        title: Text(s.name),
        subtitle: Text("Email: ${s.email}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Single_student(student: s),
            ),
          );
        },
      ),
    );
  }
}