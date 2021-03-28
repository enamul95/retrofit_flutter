import 'package:flutter/material.dart';
import 'package:retrofit_flutter/repository/retrofit/post_api.dart';
import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrofit Post Call"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("Fetch Post"),
                // onPressed: () => {
                //       setState(() {
                //         pressed = true;
                //         //fetchData(postNum);
                //       })
                //     }),

                onPressed: () => {callApi()}),
            Padding(padding: EdgeInsets.all(30)),
            // pressed ? _buildBody(context) : SizedBox(),
            // pressed:(){},
          ],
        ),
      ),
    );
  }
}

callApi() {
  print("calling ....");
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  client.getTasks();
}

FutureBuilder<Post> _buildBody(BuildContext context) {
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<Post>(
    future: client.getTasks(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final Post? posts = snapshot.data;
        return _buildPosts(context, posts!);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget _buildPosts(BuildContext context, Post posts) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Name : " + posts.name,
          style: TextStyle(fontSize: 30),
        ),
        Text(
          "Age : " + posts.age.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ],
    ),
  );
}
