import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                width: 200,
                height: 150,
                child: Image.asset('asset/login.png')),
             ),
           ),const Padding(

              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30, bottom: 0),
                child: TextField(

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintMaxLines: 10
                  ),
                ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
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
                  print("Login Successfully");
                  },
                child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 30),),
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