import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_registration/screens/GridViewHome.dart';

import '../models/Models.dart';
import '../services/UserData_Controller.dart';

void main(){
  }

class HomePage extends StatefulWidget{
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<User>? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }
  Future<void> getData()async{
    user = await getAllUsers();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Data: List View"),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: user?.length??0,
        itemBuilder: (context,index){
          if(user == null){
            return CircularProgressIndicator();
          }else{
            print(user![1]);
            final users = user![index];
            return Padding(padding: const EdgeInsets.all(18),
            child: Card(
              child: Container(
                child: Row(
                  children: [
                    Expanded(flex: 1,child: Container(child: Text(users.userName ?? '')),
                    ),
                    Expanded(flex: 1,child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.edit)),
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.delete))
                      ],
                    ),)
                  ],
                ),
              ),
            ),);
          }
        },

      ),
      drawer:Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
              child: Text("Navigation Bar"),),
            ListTile(
              title: Text("ListView"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
              },

            ),
            ListTile(
              title:Text("GridView"),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => GridViewHome())));
              } ,
            )
          ],
        ),
      ),

    );
  }
}