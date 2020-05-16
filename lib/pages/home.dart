import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/pages/courses.dart';
import 'package:login_navigation/pages/professors.dart';
import 'package:login_navigation/pages/students.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_view_day),
                text: "cursos",
              ),
              Tab(
                icon: Icon(Icons.people),
                text: "estudiantes",
              ),
              Tab(
                icon: Icon(Icons.people),
                text: "profesores",
              ),
            ],
          ),
          title: Text("app"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                pro.logOut();
              }
            ),
          ],
        ),
        body: TabBarView(
          children: [Cours(), StudentsView(), ProfessorsView()]
        ),
      ),
    );
  }
  
}









/*
Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bienvenido ${pro.user.Name}',
              ),
              RaisedButton(
                onPressed: (){
                  pro.checkToken();
                },
                color: Colors.green,
                child: Text("check token"),
                textColor: Colors.white
              ),
              RaisedButton(
                onPressed: (){
                  pro.getCourses();
                },
                color: Colors.blueAccent,
                child: Text("courses"),
                textColor: Colors.white
              ),
              //CourseList(),                       COOMMMMMMMMMMEEEEEEEENNNNNNNNNTTTTTTTTEEEEEEDDDDDDDDD
            ],
          ),
        )

 */