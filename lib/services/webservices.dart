import 'dart:convert';
import 'package:login_navigation/models/user.dart';
import 'package:http/http.dart' as http; 

class Webservice {

  Future<User> signIn(String email, String password) async {
    final response = await http.post('https://movil-api.herokuapp.com/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,'password': password
      }),
    );
    
    if (response.statusCode == 200) {
      print('${response.body}');
      print('allesokSignInBaby');
      return User.fromJson(json.decode(response.body));
    } else {
      print("signup failed");
      print('${response.body}');
      return null;
      //throw Exception(response.body);
    }
  }

  Future<User> signUp(String email, String password, String username, String name) async {
    final response = await http.post(
      'https://movil-api.herokuapp.com/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,'password': password,'username': username,'name': name
      }),
    );

    if (response.statusCode == 200) {
      print('${response.body}');
      print('allesokbaby UP');
      return User.fromJson(json.decode(response.body));
    } else {
      print("signup failed");
      print('${response.body}');
      //throw Exception(response.body);
      return null;
    }
  }
  
  Future<bool> checkToken(String token) async {
    bool isValid = false;
    final response = await http.post(
      'https://movil-api.herokuapp.com/check/token',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': token
      }),
    );

    if (response.statusCode == 200) {
      print('${response.body}');
      isValid = json.decode(response.body)['valid'];
      print(isValid);
    } else {
      print("error");
      print('${response.body}');
      //throw Exception(response.body);
      //return null;
    }
    return isValid;
  }  

  // Future<void> check(String token) async{
  //   Uri uri = Uri.https("movil-api.herokuapp.com", 'check/$token');
  //   final http.Response response = await http.post(
  //     uri,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       //HttpHeaders.authorizationHeader: "Bearer " + token,
  //     },
  //   );
  //   print(uri.toString());
  //   print('token $token');
  //   print('${response.statusCode}');
  //   print('response -> ${response.body}');    
  // }

}








