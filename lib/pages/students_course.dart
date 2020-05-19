import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/models/student.dart';
import 'package:login_navigation/pages/single_student.dart';

class Students_course extends StatefulWidget {

  List<Student> list;

  Students_course({Key key, @required this.list}) : super(key: key);

  @override
  _Students_courseState createState() => _Students_courseState(list);
}

class _Students_courseState extends State<Students_course> {

  List<Student> list;

  _Students_courseState(this.list);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: studentList(),
    );
  }

  Widget studentList() {
    print(list);
    return ListView.builder(
      itemCount: this.list.length,
      itemBuilder: (context, index){
        final name = this.list[index].name;
        final email = this.list[index].email;
        // print("ADDIIINNGGG");
        return item(this.list[index]);
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