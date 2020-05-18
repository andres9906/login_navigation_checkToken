import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/courses_controller.dart';
import 'package:login_navigation/models/course.dart';
import 'package:provider/provider.dart';

class Single_course extends StatefulWidget {

  final Course course;
  
  Single_course({Key key, @required this.course}) : super(key: key);

  @override
  _Single_courseState createState() => _Single_courseState(course);
}

class _Single_courseState extends State<Single_course> {

  Course course;

  Course coursefull;

  String name = "";

  _Single_courseState(this.course);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);

    if(coursefull == null){
      getCourse(pro.user.username, pro.user.token);
      // print(professors.length);
    }

    return courseShow();
  }

  getCourse(String username, String token) async {
    Courses().fetchCourse(username, token, course.id).then((value){
      if(mounted){
        setState(() {
            coursefull = value;
            name = value.name;
        });
      }
    });
  }

  Widget courseShow(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: Center(
        child: Container(
          child: Text(name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          )
        ),
      ),
    );
  }

}