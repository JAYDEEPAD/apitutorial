import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  void signup(String email,password) async {
    try{
      Response response= await post(
          Uri.parse("https://reqres.in/api/register"),
          body: {
            'email': email,
             'password':password,
          }
          );
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data);
        print("account create succesfully");
      }
      else{
        print("failed");
      }
    }catch (e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup api"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailcontroller,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          TextFormField(
            controller: passwordcontroller,
            decoration: InputDecoration(
              hintText: "Password"
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              signup(emailcontroller.text.toString(),passwordcontroller.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text("Signup"),
              ),
            ),
          )
        ],
      )
    );
  }
}
