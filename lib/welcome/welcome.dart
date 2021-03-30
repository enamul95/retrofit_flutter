import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_flutter/repository/retrofit/post_api.dart';

class Welcome extends StatelessWidget {
  //Post post;

  //Welcome(Post it);

  final Post post;
  Welcome({required this.post});

  //final Post post;
  //const Welcome(this.post);

  // Welcome(this.post);

  //late final Post post;
  //final Clothes clothes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to RMS"),
      ),
      body: WelcomeBody(post),
    );
  }
}

class WelcomeBody extends StatefulWidget {
  Post post;
  WelcomeBody(Post this.post);

  @override
  State<StatefulWidget> createState() {
    return CustomBodybody(post);
  }
}

class CustomBodybody extends State<WelcomeBody> {
  Post post;
  CustomBodybody(Post this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text(post.outMessage)],
          ),
          Row(
            children: <Widget>[Text("User Name: "), Text("Enamul Haque")],
          ),
          Row(
            children: <Widget>[Text("User Name: "), Text("Enamul Haque")],
          ),
          Row(
            children: <Widget>[Text("User Name: "), Text("Enamul Haque")],
          ),
        ],
      ),
    );
  }
}
