import 'dart:js';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:retrofit_flutter/repository/retrofit/post_api.dart';
import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';
import 'package:retrofit_flutter/welcome/welcome.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      //  home: MyCustomForm(),
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
      body: Container(
        // color: Colors.cyanAccent,
        //  margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: const EdgeInsets.all(20.0),
                        labelText: 'User Name',
                        hintText: 'Enter User Id.'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Passowrd',
                        hintText: 'Enter Password'),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20)),
                  onPressed: () => {doLogin(context)},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

doLogin(BuildContext context) {
  print("calling ....");
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  client.getTasks().then((it) {
    ///  Logger().i(it);

    if ("0" == it.outCode) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    }
  }).catchError((error, stackTrace) {
    // non-200 error goes here.
    print("inner: $error");
  });
}

// tasks.
/*Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Welcome()),
  );
  */
