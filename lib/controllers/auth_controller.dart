import 'package:flutter/material.dart';
import 'package:login_navigation/models/user.dart';
import 'package:login_navigation/services/webservices.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Auth extends ChangeNotifier{
  User user;
  bool newsesion;
  Auth({this.user,this.newsesion=true});
  
  
  Future<void> signin(String email, String password) async{
    user = await Webservice().signIn(email, password);
    if(user != null){
      savePreferencesUser();
      notifyListeners();
    }
  }
  
  Future<void> signup(String email, String password, String username, String name) async {
    user = await Webservice().signUp(email, password, username, name);
    if(user != null){
      savePreferencesUser();
      notifyListeners();      
    }
  }

  void logOut() async{
    this.user = null;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('name');
    preferences.remove('username');
    preferences.remove('token');
    notifyListeners();
  }

  savePreferencesUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', user.name);
    preferences.setString('username', user.username);
    preferences.setString('token', user.token);
  }

  loadPreferencesUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String name = preferences.getString('name');
    String username = preferences.getString('username');
    String token = preferences.getString('token');
    
    if(name != null && username != null && token != null && name.isNotEmpty && username.isNotEmpty && token.isNotEmpty){
      user = User(name: name, username: username, token: token);
      notifyListeners();
    }
  }

  Future<void> checkToken() async {
    if(!await Webservice().checkToken(user.token)){
      logOut();
    }

    //Webservice().check(user.token);
  }

}