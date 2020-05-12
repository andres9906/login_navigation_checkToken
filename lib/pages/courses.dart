import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/courses_controller.dart';
import 'package:login_navigation/models/course.dart';
import 'package:provider/provider.dart';

class Cour extends StatefulWidget {

  @override
  _CourState createState() => _CourState();
}

class _CourState extends State<Cour> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cour"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              pro.logOut();
            }
          ),
        ],
      ),
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
        print("ADDIIINNGGG");
        return item(name);
      },
    );
  }

  addCourse(String a, String b)async{
    Course c = await Courses().addCourse(a, b);
    setState(() {
      this.courses.add(c);
    });
    print(courses.length);
  }

  Widget item(String name){
    return Card(
      child:ListTile(
        title: Text(name),
      ),
    );
  }
}