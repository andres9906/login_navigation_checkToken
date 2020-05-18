import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/models/student.dart';

class Single_student extends StatelessWidget {
  final Student student;

  Single_student({Key key, @required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: Center(
        child: Container(
          child: Text(student.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          )
        ),
      ),
    );
  }
}