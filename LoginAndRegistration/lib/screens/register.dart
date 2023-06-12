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
      home: Login(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class Login extends StatelessWidget{
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
              child: TextField(
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
              child:  TextField(
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
              child: TextField(
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
              child: TextField(
                controller:passwordChecker,
                obscureText: true,
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
                  if(signupController.usernameController.text.isNotEmpty||signupController.passwordController.text.isNotEmpty||signupController.emailController.text.isNotEmpty||passwordChecker.text.isEmpty) {
                    if (signupController.passwordController.text == passwordChecker.text) {
                      signupController.RegisterUser();
                    } else {
                      print("Password incorrect");
                    }
                  }else{
                    AlertDialog(
                      title: Text("!!!Alert!!!"),
                      content: Text("Input Correct data"),
                      actions: <Widget>[ElevatedButton(onPressed: (){}, child: Text("Ok"))],
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