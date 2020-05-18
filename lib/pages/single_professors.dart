import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/models/professor.dart';
import 'package:login_navigation/models/student.dart';

class Single_professor extends StatelessWidget {
  final Professor professor;

  Single_professor({Key key, @required this.professor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: Center(
        child: Container(
          child: Text(professor.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          )
        ),
      ),
    );
  }
}