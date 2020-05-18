import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login_navigation/models/professor.dart'; 

class ProfessorService{

  Future<List<Professor>> getProfessors(String username, String token) async{
    Uri uri = Uri.https("movil-api.herokuapp.com", '$username/professors');
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
      return json.map((professor)=>Professor.fromJson(professor)).toList();
    }
    return null;
  }

  Future<Professor> getProfessor(String username, String token, int pid) async{
    Uri uri = Uri.https("movil-api.herokuapp.com", '$username/professors/$pid');
    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer " + token,
      },
    );
    if(response.statusCode == 200){
      return Professor.fromJson2(json.decode(response.body));
    }
  }

  // Future<Professor> createProfessor(String username, String token) async{
  //   Uri uri = Uri.https("movil-api.herokuapp.com", '$username/professors');
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
  //     return Professor.fromJson(json.decode(response.body));
  //   }
  //   print("STUUUUDEENTTTTSSS ERRORRRR");
  //   return null;
  // }  

  
}