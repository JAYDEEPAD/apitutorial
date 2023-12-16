import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {

  List<photos> photolist=[];
  Future<List<photos>> getPhotolist() async {
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());
    print(data);
    if(response.statusCode==200){
      for(Map i in data){
       photos photo=photos(title:i['title'], url:i['url'],id: i['id']);
       photolist.add(photo);
      }
      return photolist;
    }
    else
      {
     return photolist;
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple model class"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotolist(),
                builder: (context,AsyncSnapshot<List<photos>>snapshot){
                  return  ListView.builder(
                      itemCount: photolist.length,
                      itemBuilder: (context,index){
                         return ListTile(
                           leading: CircleAvatar(
                             backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                           ),
                          subtitle: Text("Notes"+snapshot.data![index].id.toString()),
                          title: Text(snapshot.data![index].title.toString()),

                         ) ;
                      });

            }),
          )

        ],
      ),
    );
  }
}

class photos{
  String title,url;
  int id;
  photos({required this.title, required this.url, required this.id});
}