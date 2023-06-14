import 'package:flutter/material.dart';
import 'package:login_and_registration/services/register_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Register',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Register(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class Register extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  SignupController signupController = SignupController();
  TextEditingController passwordChecker = TextEditingController();
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.lightBlue,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('asset/login.png')),
                ),
              ), Padding(

                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter the user name";
                    }else{
                      return null;
                    }
                  },
                  controller: signupController.usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintMaxLines: 10
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
                child:  TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter the email";
                    }else{
                      return null;
                    }
                  },
                  controller: signupController.emailController,
                  decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Please Enter a valid email"
                  ),
                ),
              ),
               Padding(
                padding:const  EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter your password";
                    }else{
                      return null;
                    }
                  },
                  controller: signupController.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Please enter a secure password"
                  ),
                ),
              ),
                Padding(
                padding:EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: TextFormField(
                  controller:passwordChecker,
                  obscureText: true,
                  validator: (value){
                    if(value!.isEmpty || signupController.passwordController.text!=passwordChecker.text){
                      return "Please re-check your password";
                    }else{
                      return null;
                    }
                  },
                  decoration:const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Re-Enter Password",
                      hintText: "Please the same password you've type."
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 250,
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 0),

                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      signupController.RegisterUser();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Processing"))
                      );

                    }
                  },
                  child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 30),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue,primary: Colors.white),
                ),
              )
            ],
          ),


      ),
      ),
    );
  }

}

class MyAppState extends ChangeNotifier{
  var welcome = "Hello";
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    welcome = "Welcome to the page";
    super.notifyListeners();
  }
}