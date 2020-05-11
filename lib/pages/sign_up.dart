import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget{

  final _formKey = GlobalKey<FormState>();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();
  final usernameTextField = TextEditingController();
  final nameTextField = TextEditingController();


  Widget addTextField(String label, String missingMessage, var controller){
   return Padding(
     padding: const EdgeInsets.all(3.0),
     child: SizedBox(
        child:TextFormField(
          decoration: InputDecoration(  
            labelText: label,  
          ),
          validator: (value) {
            if (value.isEmpty) {
              return missingMessage;
            }
            return null;
          },
          controller: controller,
        ),
        height: 50,
        width: 220,
      ),
   );    
  }



  @override
Widget build(BuildContext context) {
    var prov = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  addTextField("Email", "Please enter email", emailTextField),
                  addTextField("Password", "Please enter password", passwordTextField),
                  addTextField("Username", "Please enter username", usernameTextField),
                  addTextField("Name", "Please enter name", nameTextField),
                  RaisedButton(
                    color: Colors.tealAccent,
                    onPressed:(){
                      if(_formKey.currentState.validate()){
                        prov.signup(emailTextField.text, passwordTextField.text, usernameTextField.text, nameTextField.text);
                      }
                      return null;
                    },
                    child: Text("Sign up"),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }

}