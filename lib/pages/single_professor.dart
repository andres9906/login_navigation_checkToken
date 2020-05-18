import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/professors_controller.dart';
import 'package:login_navigation/models/professor.dart';
import 'package:provider/provider.dart';

class Single_professor extends StatefulWidget {

  final Professor professor;
  Single_professor({Key key, @required this.professor}) : super(key: key);

  @override
  _Single_professorState createState() => _Single_professorState(professor);
}

class _Single_professorState extends State<Single_professor> {

  Professor professor;

  Professor professorfull;

  String name = "";


  _Single_professorState(this.professor);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);

    if(professorfull == null){
      getProfessor(pro.user.username, pro.user.token);
      // print(professors.length);
    }

    return professorShow();
  }

  getProfessor(String username, String token) async {
    Professors().fetchProfessor(username, token, professor.id).then((value){
      if(mounted){
        setState(() {
            professorfull = value;
            name = value.name;
        });
      }
    });
  }

  Widget professorShow(){
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

  // return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Student'),
  //     ),
  //     body: Center(
  //       child: Container(
  //         child: Text(professor.name,
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
  //           textAlign: TextAlign.center,
  //         )
  //       ),
  //     ),
  //   );

  
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:login_navigation/controllers/professors_controller.dart';
// import 'package:login_navigation/models/professor.dart';
// import 'package:login_navigation/models/student.dart';

// class Single_professor extends StatelessWidget {
//   final Professor professor;

//   Single_professor({Key key, @required this.professor}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student'),
//       ),
//       body: Center(
//         child: Container(
//           child: Text(professor.name,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             textAlign: TextAlign.center,
//           )
//         ),
//       ),
//     );
//   }
// }