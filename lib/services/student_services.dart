import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login_navigation/models/student.dart'; 

class StudentService{

  Future<List<Student>> getStudents(String username, String token) async{
    Uri uri = Uri.https("movil-api.herokuapp.com", '$username/students');
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
      return json.map((student)=>Student.fromJson(student)).toList();
    }
    return null;
  }

  // Future<Student> createStudent(String username, String token) async{
  //   Uri uri = Uri.https("movil-api.herokuapp.com", '$username/students');
  //   final http.Response response = await http.post(
  //     uri,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       HttpHeaders.authorizationHeader: "Bearer " + token,
  //     },
  //   );
  //   print(uri.toString());
  //   print('token $token');
  //   print('${response.statusCode}');
  //   print('response -> ${response.body}');    
  //   if(response.statusCode == 200){
  //     return Student.fromJson(json.decode(response.body));
  //   }
  //   print("STUUUUDEENTTTTSSS ERRORRRR");
  //   return null;
  // }  

  
}