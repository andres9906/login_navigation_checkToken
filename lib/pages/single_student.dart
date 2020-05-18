import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/students_controller.dart';
import 'package:login_navigation/models/student.dart';
import 'package:provider/provider.dart';

class Single_student extends StatefulWidget {

  final Student student;
  Single_student({Key key, @required this.student}) : super(key: key);
  @override
  _Singel_studentState createState() => _Singel_studentState(student);
}

class _Singel_studentState extends State<Single_student> {
  Student student;

  Student studentfull;

  String name = "";

  _Singel_studentState(this.student);

  

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);

    if(studentfull == null){
      getStudent(pro.user.username, pro.user.token);
      // print(professors.length);
    }

    return studentShow();
  }

  getStudent(String username, String token) async {
    Students().fetchStudent(username, token, student.id).then((value){
      if(mounted){
        setState(() {
            studentfull = value;
            name = value.name;
        });
      }
    });
  }

  Widget studentShow(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: Center(
        child: Container(
          child: Text(name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          )
        ),
      ),
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:login_navigation/models/student.dart';

// class Single_student extends StatelessWidget {
//   final Student student;

//   Single_student({Key key, @required this.student}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student'),
//       ),
//       body: Center(
//         child: Container(
//           child: Text(student.name,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             textAlign: TextAlign.center,
//           )
//         ),
//       ),
//     );
//   }
// }