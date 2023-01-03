import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExamplePhotos extends StatefulWidget {
  const ExamplePhotos({Key? key}) : super(key: key);

  @override
  State<ExamplePhotos> createState() => _ExamplePhotosState();
}

class _ExamplePhotosState extends State<ExamplePhotos> {
  List<Photos> photoslist = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photoslist.add(photos);
      }
      return photoslist;
    }
    else {
      return photoslist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Two API'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPhotos(),builder: (context,snapshot){
              return ListView.builder(itemCount: photoslist.length,itemBuilder: (context,index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(photoslist[index].url.toString()),
                  ),
                  subtitle: Text(photoslist[index].title.toString()),
                  title: Text('Notes id:'+photoslist[index].id.toString()),

                );
              });            }),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;

  Photos({required this.title, required this.url, required this.id});
}
