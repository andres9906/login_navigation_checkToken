import 'package:flutter/material.dart';

class CourseList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text("course"),
        );
      },
    );
  }

}