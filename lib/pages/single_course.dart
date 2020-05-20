import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/courses_controller.dart';
import 'package:login_navigation/models/course.dart';
import 'package:login_navigation/models/professor.dart';
import 'package:login_navigation/pages/single_professor.dart';
import 'package:login_navigation/pages/students_course.dart';
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

  String professor = "";

  Professor professorObj;

  String nStudents = "";

  int _selectedIndex = 0;

  _Single_courseState(this.course);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget showSelected(){
    if(_selectedIndex == 0){
        return(infoCourse());
      }else{
        if(_selectedIndex == 1){
          return(Single_professor(professor: professorObj));
        }else{
          return(Students_course(list: coursefull.studentsObj));
        }
    }
  }


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
    Courses().fetchCourse(username, token, course.id, context).then((value){
      if(mounted){
        setState(() {
            coursefull = value;
            name = value.name;
            professor = value.professorObj.name;
            nStudents = course.students.toString();
            professorObj = value.professorObj;
        });
      }
    });
  }

  Widget courseShow(){
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: showSelected(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Courses'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Professor'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Students'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget showInfo(String info){
    return(
      Expanded(
        child: Container(
          child: Text(info,
          style: TextStyle(fontSize: 16,color: Colors.black),),
          width: double.infinity,
          alignment: Alignment.centerLeft,
        ),
      )
    );
  }

  Widget infoCourse(){
    return(
      Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Text("Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Color.fromRGBO( 227, 227, 227 , 1),
                child: Column(
                  children: <Widget>[
                    showInfo("Name:       "+name),
                    Divider(
                      color: Colors.black
                    ),
                    showInfo("Professor:        "+professor),
                    Divider(
                      color: Colors.black
                    ),
                    showInfo("Number of students:        "+nStudents),
                    // showInfo("Phone:        "+phone),
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }

}