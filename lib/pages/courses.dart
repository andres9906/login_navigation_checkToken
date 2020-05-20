import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/courses_controller.dart';
import 'package:login_navigation/models/course.dart';
import 'package:login_navigation/pages/single_course.dart';
import 'package:provider/provider.dart';

class Cours extends StatefulWidget {

  @override
  _CoursState createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);

    if(courses.length == 0){
      getCourses(pro.user.username, pro.user.token);
      print(courses.length);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Courses"),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.exit_to_app),
      //       onPressed: (){
      //         pro.logOut();
      //       }
      //     ),
      //   ],
      // ),
      body: courseList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){addCourse(pro.user.username, pro.user.token);},
        child: Icon(Icons.add),
      ),
    );
  }

  List<Course> courses = new List<Course>();

  Widget courseList() {
    return ListView.builder(
      itemCount: this.courses.length,
      itemBuilder: (context, index){
        final name = this.courses[index].name;
        final professor = this.courses[index].professor;
        // print("-------------------------id");
        // print(this.courses[index].id);
        // print("-------------------------id");
        return item(this.courses[index]);
      },
    );
  }

  addCourse(String username, String token)async{
    Course c = await Courses().addCourse(username, token, context);
    if(mounted){
      setState(() {
          this.courses.add(c);
      });
      print(courses.length);
    }
  }

  getCourses(String username, String token)async{
    List<Course> tempC = await Courses().fetchCourses(username, token, context);

    if(mounted && tempC != null){
      setState(() {
      this.courses.addAll(tempC);
      });
    }
  }

  Widget item(Course c){
    return Card(
      child:ListTile(
        title: Text(c.name),
        subtitle: Text("Professor: ${c.professor}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Single_course(course: c),
            ),
          );
        },
      ),
    );
  }
}