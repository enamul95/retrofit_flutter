import 'package:flutter/material.dart';
import 'package:retrofit_flutter/repository/retrofit/post_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_flutter/util/custom_sweet_alert.dart';
import 'package:retrofit_flutter/welcome/welcome.dart';
import 'package:sweetalert/sweetalert.dart';

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
  bool _isInAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return SingleChildScrollView(
      child: Container(
        child: Form(
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
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20)),
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Processing Data')))
                          //print(usernameController.text)
                          // SweetAlert.show(context,
                          //     title: "Just show a message",
                          //     subtitle: "Sweet alert is pretty"),
                          // SweetAlert.show(context,
                          //     subtitle: "Deleting...",
                          //     style: SweetAlertStyle.loading),
                          Custom_SweetAlert.showProgressDialog(context),
/*
                          doLoginAction(
                              context,
                              usernameController.text.toString(),
                              passwordController.text.toString()),
                              */
                        }
                      // doLogin(context)
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

doLoginAction(BuildContext context, String username, String password) {
  print("calling ....");
  // start the modal progress HUD

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
