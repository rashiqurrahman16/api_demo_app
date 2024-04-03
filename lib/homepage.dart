
import 'dart:convert';

import 'package:api_demo_app/model/postModel.dart';
import 'package:api_demo_app/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){

      for(Map i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Demo'),
        centerTitle: true,
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => const RegistrationPage()),
            );
          }, child: Text('Page2')),
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PostModel>> snapshot) {
                  if(!snapshot.hasData){
                    return Center(
                      child: Text("Loading"),
                    );
                  }
                  else{
                    return ListView.builder(
                      itemCount: postList.length,
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text("Id: "+postList[index].id.toString()),
                                        Text("Title: "+postList[index].title.toString()),
                                        Text("Body: "+postList[index].body.toString()),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          );
                        }
                    );
                  }
              },
            
            ),
          )
        ],
      ),


    );
  }
}
