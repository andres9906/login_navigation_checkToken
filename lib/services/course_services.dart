import 'dart:convert';
import 'dart:io';

import 'package:login_navigation/models/course.dart';
import 'package:http/http.dart' as http; 

class CourseService{

  Future<List<Course>> getCourses(String username, String token) async{
    Uri uri = Uri.https("movil-api.herokuapp.com", '$username/courses');
    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer " + token,
      },
    );
    print(uri.toString());
    print('token $token');
    print('${response.statusCode}');
    print('response -> ${response.body}');    
    if(response.statusCode == 200){
      Iterable json = jsonDecode(response.body);
      return json.map((course)=>Course.fromJson(course)).toList();
    }
    return null;
  }

  Future<Course> createCourse(String username, String token) async{
    Uri uri = Uri.https("movil-api.herokuapp.com", '$username/courses');
    final http.Response response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer " + token,
      },
    );
    print(uri.toString());
    print('token $token');
    print('${response.statusCode}');
    print('response -> ${response.body}');    
    if(response.statusCode == 200){
      return Course.fromJson(json.decode(response.body));
    }
    print("COURSEEEEEE ERRORRRR");
    return null;
  }  

  
}