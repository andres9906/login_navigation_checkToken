import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/pages/courses.dart';
import 'package:login_navigation/pages/home.dart';
import 'package:login_navigation/pages/sign_up.dart';
import 'package:login_navigation/pages/sing_in.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Auth(),
      child: MaterialApp(
        title: 'Login Navigation',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage(title: 'None'),
        routes: {
          '/signup': (_) => SignUp(),
        },
      ),
    );
    
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // int _counter = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Auth>(context);
    if(prov.newsesion){
      prov.loadPreferencesUser();
      prov.newsesion=false;
      print("NUEVA SESION");
    }

    if(prov.user != null){
      print(prov.user);
      return Cours();
    }else{
      return SignIn();
    }
  }
}