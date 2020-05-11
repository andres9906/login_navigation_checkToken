import 'package:login_navigation/services/webservices.dart';

class Courses{
  void addCourse(String username, String token){
    Webservice().createCourse(username, token);
  }
}