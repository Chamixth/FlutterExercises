import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Models.dart';
import '../services/UserData_Controller.dart';

void main(){
}

class GridViewHome extends StatefulWidget{
  State<GridViewHome> createState() => _GridViewHomeState();
}

class _GridViewHomeState extends State<GridViewHome>{
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
        title: const Text("User Data: Grid View"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        physics: ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
        itemCount: user?.length??0,
        itemBuilder: (context,index){
        final users = user![index];
          return Container(

            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Text(users.userName),
          );
        },
      ),

    );
  }
}