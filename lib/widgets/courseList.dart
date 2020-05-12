// import 'package:flutter/material.dart';
// import 'package:login_navigation/controllers/courses_controller.dart';
// import 'package:login_navigation/models/course.dart';

// class CourseList extends StatelessWidget{

//   List<Course> courses = new List<Course>();

//   getCourses(String username, String token) async{
//     List<Course> temp= await Courses().fetchCourses(username, token);
//     courses.addAll(temp);
//   }

//   addCourse(String username, String token) async{
//     Course c = await Courses().addCourse(username, token);
//     courses.add(c);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: courses.length,
//       itemBuilder: (BuildContext context, int index){
//         return ListTile(
//           title: Text(courses[index].name),
//         );
//       },
//     );
//   }
// }