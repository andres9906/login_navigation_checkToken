import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/widgets/courseList.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  showTheDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Welcome to max!"),
          content: Text("We hope you enjoy our app :)"),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              pro.logOut();
            }
          ),
        ],
      ),
      body: Center(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          CourseList().addCourse(pro.user.username, pro.user.token);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  
}