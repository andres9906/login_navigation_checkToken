import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/courses_controller.dart';
import 'package:login_navigation/models/course.dart';

class CourseList extends StatelessWidget{
  List<Course> courses = new List<Course>();

  addCourse(String username, String token){
    Courses().addCourse(username, token);
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(courses[index].name),
        );
      },
    );
  }
}