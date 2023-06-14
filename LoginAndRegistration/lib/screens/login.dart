import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_and_registration/screens/register.dart';
import 'package:login_and_registration/services/auth_controller.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class Login extends StatelessWidget{


  final _formKey = GlobalKey<FormState>();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context){
    void onSuccess(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }




    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:Form (
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('asset/login.png')),
                  ),
                ), Padding(

                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30, bottom: 0),
                  child: TextFormField(
                    controller: authController.usernameController,
                    validator:(value){
                      if(value!.isEmpty){
                        return "Please enter the Username";
                      }else{
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintMaxLines: 10
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30, bottom: 0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be empty";
                      }else{
                        return null;
                      }
                    },
                    controller: authController.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border:OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter a secure password"
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 250,
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30, bottom: 0),

                  child: ElevatedButton(
                    onPressed: (){

                      if(_formKey.currentState!.validate()){
                        authController.loginUser(onSuccess);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Processing"))
                        );

                      }


                    },
                    child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 30),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue,primary: Colors.white),
                  ),
                ),

                Container(
                  height: 100,
                  width: 450,
                  padding: EdgeInsets.only(left: 170.0, right: 10.0, top: 70, bottom: 0),
                  child: InkWell(
                    child: Text("Sign Up!", style: TextStyle(fontSize: 20,color: Colors.lightBlueAccent, decoration: TextDecoration.underline),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    } ,
                  ),
                )
              ],
            ),
          )

      ),


    );
  }


}

