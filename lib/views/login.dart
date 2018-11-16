import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carpooling/utils/constants.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final loginScaffoldKey = GlobalKey<ScaffoldState>();
  final loginFormKey = GlobalKey<FormState>();

  http.Response response;

  String _username;
  String _password;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        child: new Scaffold(
          key: loginScaffoldKey,
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                disabledColor: Colors.black,
                onPressed: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                }),
            title: new Text(
              Constants.loginScreenTitle,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: -1.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black),
                onPressed: () {},
              )
            ],
          ),
          body: SafeArea(
            child: Container(
              child: Form(
                key: loginFormKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    new FlutterLogo(
                      size: 90.0,
                    ),
                    new Text(
                      Constants.appName,
                      style: new TextStyle(
                        fontSize: Theme.of(context).textTheme.headline.fontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: Constants.labelUsername,
                        hintText: Constants.hintUserName,
                        icon: const Icon(Icons.perm_identity),
                      ),
                      validator: (value) =>
                          (value.isEmpty) ? 'Username can\'t be empty' : null,
                      onSaved: (value) => _username = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: Constants.labelPassword,
                        hintText: Constants.hintPassword,
                        icon: const Icon(Icons.lock_outline),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                      ),
                      obscureText: true,
                      validator: (value) => (value.length < 4)
                          ? 'Your password is too short'
                          : null,
                      onSaved: (value) => _password = value,
                      autovalidate: true,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 16.0)),
                    new Container(
                      padding: EdgeInsets.all(16.0),
                      child: new RaisedButton(
                        child: new Text(
                          Constants.btnLogin.toUpperCase(),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        //disabledColor: Colors.blue,
                        splashColor: Colors.lightBlueAccent,
                        onPressed: _submit,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _submit() {
    final form = loginFormKey.currentState;
    if (form.validate()) {
      form.save();
     // _login();
      _performLogin();
    }
  }

  void _performLogin() {
    // show progressbar or something like that to show
    // an interaction to the user.

    // For demo purposes we choose to show a snackBar for the moment.
    final snackBar =
        SnackBar(content: Text('Email: $_username, password: $_password '));
    loginScaffoldKey.currentState.showSnackBar(snackBar);

    Navigator.pushNamed(context, '/home');
  }

  Future<List> _login() async {
    final resp = await http.post(
      "http://192.168.2.11/comodo_app/login.php",
      /*body:{
      "username": _username,
      "password": _password,
    }*/
    );

    if (resp.statusCode == 200) {
      final snackBar = SnackBar(content: Text(resp.body));
      loginScaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}
