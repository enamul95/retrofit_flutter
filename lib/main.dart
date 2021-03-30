import 'dart:js';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/http.dart';
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
      // home: Home(),
      home: Scaffold(
        body: Login(),
      ),
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
                  onPressed: () => {
                    // doLogin(context)
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
doLogin(BuildContext context) {
  print("calling ....");
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  client.getTasks("", "").then((it) {
    ///  Logger().i(it);

    if ("0" == it.outCode) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Welcome(post: it)));
    }
  }).catchError((error, stackTrace) {
    // non-200 error goes here.
    print("inner: $error");
  });
}
*/
// tasks.
/*Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Welcome()),
  );
  */

class Login extends StatefulWidget {
  @override
  CustomLogin createState() {
    return CustomLogin();
  }
}

class CustomLogin extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter User name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'User Name',
                      hintText: 'Enter User Id.'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
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
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Processing Data')))
                      //print(usernameController.text)
                      doLoginAction(context, usernameController.text.toString(),
                          passwordController.text.toString()),
                    }
                  // doLogin(context)
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

doLoginAction(BuildContext context, String username, String password) {
  print("calling ....");
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  client.getTasks(username, password).then((it) {
    if ("0" == it.outCode) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Welcome(post: it)));
    }
  }).catchError((error, stackTrace) {
    // non-200 error goes here.
    print("inner: $error");
  });
}
