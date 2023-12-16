import 'dart:convert';

import 'package:apitutorial/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NestedApiScreen extends StatefulWidget {
  const NestedApiScreen({Key? key}) : super(key: key);

  @override
  State<NestedApiScreen> createState() => _NestedApiScreenState();
}

class _NestedApiScreenState extends State<NestedApiScreen> {
  
  List<UserModel> userlist=[];
  
  Future<List<UserModel>> getUserApi() async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(response.body.toString());
    print(data);

    if(response.statusCode==200){
      for(Map i in data){
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    }
    else{
      return userlist;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nested Api practice"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else{
                    return ListView.builder(
                        itemCount: userlist.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  children: [
                                     ReuseableRow(title: "Name", value: snapshot.data![index].name.toString(),)
                                  ],

                              ),
                            ),
                          );
                        });
                  }
                }),

          )
        ],
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {
  String title,value;
  ReuseableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}

