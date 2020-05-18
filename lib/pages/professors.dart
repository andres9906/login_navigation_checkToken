import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/controllers/professors_controller.dart';
import 'package:login_navigation/models/professor.dart';
import 'package:login_navigation/pages/single_professor.dart';
import 'package:provider/provider.dart';

class ProfessorsView extends StatefulWidget{
  @override
  _ProfessorsViewState createState() => _ProfessorsViewState();
}

class _ProfessorsViewState extends State<ProfessorsView> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);

    if(professors.length == 0){
      getProfessors(pro.user.username, pro.user.token);
      print(professors.length);
    }

    return Scaffold(
      body: professorList(),
    );
  }

  List<Professor> professors = new List<Professor>();

  getProfessors(String username, String token) async {
    List<Professor> tempS = await Professors().fetchProfessors(username, token);
    if(mounted){
      setState(() {
          this.professors.addAll(tempS);
      });
    }
    
  }

  Widget professorList() {
    return ListView.builder(
      itemCount: this.professors.length,
      itemBuilder: (context, index){
        final name = this.professors[index].name;
        final email = this.professors[index].email;
        print("ADDIIINNGGG");
        return item(this.professors[index]);
      },
    );
  }

  Widget item(Professor p){
    return Card(
      child:ListTile(
        title: Text(p.name),
        subtitle: Text("Email: ${p.email}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Single_professor(professor: p),
            ),
          );
        },
      ),
    );
  }
}